#!/usr/bin/env bash

# Created by argbash-init v2.8.0
# Rearrange the order of options below according to what you would like to see in the help message.
# ARG_OPTIONAL_SINGLE([prefix],[p],["The prefix of the output file"],["Audio"])
# ARG_OPTIONAL_SINGLE([url],[u],[The stream url or a description of the stream e.g. Yellowknife"],["The url for CBC Radio One in Yellowknife"])
# ARG_OPTIONAL_SINGLE([directory],[d],["The directory where the output file will be placed"],["$HOME/Audio"])
# ARG_OPTIONAL_SINGLE([time],[t],["The length of time (in minutes) of the recording"],[1])
# ARG_OPTIONAL_BOOLEAN([interactive],[i],["Switch to interactive mode for arguments"],[off])
# ARG_HELP(["Usage: stream_record options\nOptions:\n-p|--prefix: The prefix of the output file\n-u|--url The stream url or a description of the stream e.g. Yellowknife\n-d|--directory The directory where the output file will be placed\n-t|--time The length of time (in minutes) of the recording\n-i|--(no-)interactive Switch to interactive mode (or not) to gather arguments\n"])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.8.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info


die()
{
	local _ret=$2
	test -n "$_ret" || _ret=1
	test "$_PRINT_HELP" = yes && print_help >&2
 	echo "$1" >&2
	exit ${_ret}
}


begins_with_short_option()
{
local first_option all_short_options='pudtih'
first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_prefix="Audio"
_arg_url="http://cbc_r1_ykn.akacast.akamaistream.net/7/369/451661/v1/rc.akacast.akamaistream.net/cbc_r1_ykn"
_arg_url_default="${_arg_url}"
_arg_directory="$HOME/Audio"
_arg_time="1"
_arg_interactive="off"


print_help()
{
	printf '%s\n' "Command to record a radio stream using cvlc:"
	printf 'Usage: %s [-p|--prefix <arg>] [-u|--url <arg>] [-d|--directory <arg>] [-t|--time <arg>] [-i|--(no-)interactive] [-h|--help]\n' "$0"
	printf '\t%s\n' "-p, --prefix: The prefix of the output file (default: '"Audio"')"
	printf '\t%s\n' "-u, --url: The stream url or a description of the stream e.g. Yellowknife (default: 'The url for CBC Radio One in Yellowknife')"
	printf '\t%s\n' "-d, --directory: The directory where the output will be placed (default: '"$HOME/Audio"')"
	printf '\t%s\n' "-t, --time: The length of time (in minutes) of the recording (default: '1')"
	printf '\t%s\n' "-i, --interactive, --no-interactive: A switch to turn on (or off) interactive mode for the gathering of arguments (off by default)"
	printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-p|--prefix)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_prefix="$2"
				shift
				;;
			--prefix=*)
				_arg_prefix="${_key##--prefix=}"
				;;
			-p*)
				_arg_prefix="${_key##-p}"
				;;
			-u|--url)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_url="$2"
				shift
				;;
			--url=*)
				_arg_url="${_key##--url=}"
				;;
			-u*)
				_arg_url="${_key##-u}"
				;;
			-d|--directory)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_directory="$2"
				shift
				;;
			--directory=*)
				_arg_directory="${_key##--directory=}"
				;;
			-d*)
				_arg_directory="${_key##-d}"
				;;
			-t|--time)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_time="$2"
				shift
				;;
			--time=*)
				_arg_time="${_key##--time=}"
				;;
			-t*)
				_arg_time="${_key##-t}"
				;;
			-i|--no-interactive|--interactive)
				_arg_interactive="on"
				test "${1:0:5}" = "--no-" && _arg_interactive="off"
				;;
			-i*)
				_arg_interactive="on"
				_next="${_key##-i}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					begins_with_short_option "$_next" && shift && set -- "-i" "-${_next}" "$@" || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_PRINT_HELP=yes die "FATAL ERROR: Got an unexpected argument '$1'" 1
				;;
		esac
		shift
	done
}

parse_commandline "$@"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
## [ <-- needed because of Argbash
#
#
#printf 'Value of --%s: %s\n' 'prefix' "$_arg_prefix"
#printf 'Value of --%s: %s\n' 'url' "$_arg_url"
#printf 'Value of --%s: %s\n' 'directory' "$_arg_directory"
#printf 'Value of --%s: %s\n' 'time' "$_arg_time"
#printf "'%s' is %s\\n" 'interactive' "$_arg_interactive"
#
## ] <-- needed because of Argbash

declare -a a1
declare -A a2
readarray  a1 <StreamList.txt
for i in "${!a1[@]}"
do
	if  [[ $(( i % 2 ))  -eq 0 ]]
	then
 		key=$(echo "${a1[$i]}" | tr -d '\r\n\t')
#	        echo $key
	else
		value=${a1[$i]}
#               echo $value
		a2["$key"]=$value
	fi
done

#for k in "${!a2[@]}"
#do
# printf %s:%s "$k" ${a2[$k]}
#done
#

let "length = $_arg_time * 60"
if [ $_arg_interactive = "on" ]
then
	_arg_url=$(zenity --list --title="Choose the Stream you want to record" --column="Stream Name" --column "Stream URL" --print-column=2 "${a1[@]}" 2>/dev/null)
	_arg_directory=$(zenity --file-selection --file-selection=$HOME/Audio --directory 2>/dev/null)
	_arg_prefix=$(zenity --entry --title="Output file prefix" --text="Enter desired prefix for the output file" --entry-text "Stream" 2>/dev/null)
	_arg_time=$(zenity --scale --text="Number of minutes to record" --value=10 --min-value=1 --max-value=240 2>/dev/null)
fi

if [[ "${_arg_url:0:4}" != "http" ]]
then
	temp="${_arg_url%\"}"
	_arg_url="${temp#\"}"
	_arg_url="${a2[\"${_arg_url}\"]}"
	if [ -z ${_arg_url} ] 
	then 
		_arg_url="${_arg_url_default}"
	fi
fi
#  echo "$_arg_url"
#  echo "$_arg_directory"
#  echo "$_arg_prefix"
#  echo "$_arg_time"

cvlc ${_arg_url} --sout file/mp3:"${_arg_directory}/${_arg_prefix}$(date '+%F_%T').mp3" --run-time $length --stop-time $length vlc://quit

