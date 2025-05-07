if [ "$1" == "--help" ]; then
  echo "How to use this script:"
  echo "./mygrep.sh search_string filename"
  echo "  -n: Show line numbers"
  echo "  -v: Show lines that don't match"
  exit 0
fi

show_line_numbers=false
invert_match=false

while getopts "nv" option; do
  if [ "$option" == "n" ]; then
    show_line_numbers=true
  elif [ "$option" == "v" ]; then
    invert_match=true
  fi
done

shift $((OPTIND - 1))
search_string="$1"
filename="$2"

if [ -z "$search_string" ] || [ -z "$filename" ]; then
  echo "Error: Please provide both a search string and a file."
  exit 1
fi

if [ ! -f "$filename" ]; then
  echo "Error: File '$filename' does not exist."
  exit 1
fi

line_number=0
while IFS= read -r line; do
  ((line_number++))  # Increase line number by 1 for each line

  echo "$line" | grep -i "$search_string" > /dev/null
  match_found=$?

  if $invert_match; then
    match_found=$((!match_found))
  fi

  if [ $match_found -eq 0 ]; then
    if $show_line_numbers; then
      echo "$line_number: $line"
    else
      echo "$line"
    fi
  fi
done < "$filename"

