# Required input:
# 1. main Localizable location
# 2. output file

def fetch_parameter(name)
    index = ARGV.index(name)
    if index == nil || index >= ARGV.length
        raise ArgumentError.new("Parameter #{name} has not been provided")
    end
    
    ARGV[index + 1]
end

$localizable_regex = /^"(.+)"\s*=\s*"(.+)"\s*;$/i

def extract_localizable(line)
    match = line.match($localizable_regex)
    if match == nil
        return nil, nil
    end
    
    groups = match.captures
    
    return groups[0], groups[1]
end

$config = {
    :output => fetch_parameter("-o"),
    :localizable => fetch_parameter("-l")
}
$config[:prefix] = File.basename($config[:output], ".h")

$date_format = "%Y-%m-%d %H:%M:%S"
$formatted_modified_date = File.mtime($config[:localizable]).strftime($date_format)

$should_generate_file = true

if File.exists?($config[:output])
    first_line = File.open($config[:output]) {|f| f.readline}
    if first_line != nil && first_line.length > 3
        formatted_saved_date = first_line[3, first_line.length]
        if (formatted_saved_date.strip == $formatted_modified_date.strip)
            print "File #{$config[:localizable]} has not changed since last generation\n"
            $should_generate_file = false
        end
    end
end

if ($should_generate_file)
    def constant_from_key(key)
        raw_parts = key.split("_")
        result_parts = []
    
    if raw_parts.length > 1
        for raw_part in raw_parts
            result_parts << raw_part.capitalize
        end
        
        result_parts.join
        else
        key
        end
    end

    $definitions = ["// %s\n" % $formatted_modified_date]
    File.readlines($config[:localizable]).each do |line|
        key, value = extract_localizable(line)
        if key != nil && value != nil
            name = constant_from_key(key)
            $definitions << "#define #{$config[:prefix]}#{name} @\"#{key}\""
        end
    end

    begin
        File.open($config[:output], 'w') { |file|
            file.write($definitions.join("\n"))
        }
    rescue
        raise RuntimeError("Could not write result to file #{$config[:output]}")
    end
end
