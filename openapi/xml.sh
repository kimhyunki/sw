# File to be parsed
xmlFile="b.xml"

# use xml_grep to find settings in an XML file
# Input ($1): path to setting
function getXmlSetting() {

	# Filter out the element name for parsing
	local element=`echo $1 | sed 's/^.*\///'`

	# Verify the element is not empty
	local check=${element:?getXmlSetting invalid input: $1}

	# Parse out the CDATA from the XML element
	# 1) Find the element (xml_grep)
	# 2) Remove newlines (tr -d \n)
	# 3) Extract CDATA by looking for *element> CDATA <element*
	# 4) Remove leading and trailing spaces
	local getXmlSettingResult=`xml_grep --cond $1 $xmlFile 2>/dev/null | tr -d '\n' | sed -n -e "s/.*$element>[[:space:]]*\([^[:space:]].*[^[:space:]]\)[[:space:]]*<\/$element.*/\1/p"`

	# Return the result
	echo $getXmlSettingResult
}

#EXAMPLE
logPath=`getXmlSetting //config/logs/path`
check=${logPath:?"XML file missing //config/logs/path"}
