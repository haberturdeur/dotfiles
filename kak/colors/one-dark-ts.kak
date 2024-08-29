declare-option str none "rgb:1E1E1E"

declare-option str fg "rgb:d4d4d4"
declare-option str bg "%opt{none}"

declare-option str black "rgb:000000"
declare-option str gray "rgb:808080"
declare-option str violet "rgb:646695"
declare-option str blue "rgb:569cd6"
declare-option str darkblue "rgb:223e55"
declare-option str lightblue "rgb:9cdcfe"
declare-option str green "rgb:6a9955"
declare-option str bluegreen "rgb:4ec9b0"
declare-option str lightgreen "rgb:b5cea8"
declare-option str red "rgb:f44747"
declare-option str orange "rgb:ce9178"
declare-option str lightred "rgb:d16969"
declare-option str yelloworange "rgb:d7ba7d"
declare-option str yellow "rgb:dcdcaa"
declare-option str pink "rgb:c586c0"
declare-option str silver "rgb:c0c0c0"

declare-option str diffblue "rgb:87d7ff"
declare-option str diffgreen "rgb:4b5632"
declare-option str diffred "rgb:6f1313"

declare-option str comment "%opt{green}"

set-face global value "%opt{orange}"
set-face global type "%opt{bluegreen}"
set-face global variable "%opt{orange}"
set-face global module "%opt{yellow}"
set-face global function "%opt{blue}"
set-face global string "%opt{green}"
set-face global keyword "%opt{pink}"
set-face global operator "%opt{pink}"
set-face global attribute "%opt{blue}"
set-face global arguement "%opt{orange}"
set-face global comma "%opt{fg}"
set-face global comment "%opt{comment}+i"
set-face global documentation "%opt{comment}"
set-face global docstring "%opt{gray}+i"
set-face global meta "%opt{pink}"
set-face global builtin "%opt{bluegreen}"
set-face global class "%opt{lightblue}"
set-face global self "%opt{pink}"
set-face global constant "%opt{fg}+b"

declare-option str error ",,%opt{red}+c"
declare-option str warning ",,%opt{yellow}+c"

set-face global ts_attribute "%opt{bluegreen}"
set-face global ts_comment "%opt{comment}"
# set-face global ts_comment_block
# set-face global ts_comment_line
# set-face global ts_conceal
set-face global ts_constant "%opt{yellow}"
set-face global ts_constant_builtin_boolean "%opt{blue}"
set-face global ts_constant_character "%opt{orange}"
# set-face global ts_constant_character_escape
set-face global ts_constant_macro "%opt{bluegreen}"
set-face global ts_constant_numeric "%opt{bluegreen}"
# set-face global ts_constant_numeric_float
# set-face global ts_constant_numeric_integer
set-face global ts_constructor "%opt{bluegreen}"
set-face global ts_diff_plus "%opt{fg},%opt{diffgreen}"
set-face global ts_diff_minus "%opt{fg},%opt{diffred}"
set-face global ts_diff_delta "%opt{fg},%opt{diffblue}" 
# set-face global ts_diff_delta_moved
set-face global ts_error "%opt{error}"
set-face global ts_function "%opt{yellow}"
# set-face global ts_function_builtin
# set-face global ts_function_macro
# set-face global ts_function_method
# set-face global ts_function_special
# set-face global ts_hint
# set-face global ts_info
set-face global ts_keyword "%opt{blue}"
# set-face global ts_keyword_control
set-face global ts_keyword_conditional "%opt{pink}"
# set-face global ts_keyword_control_conditional
# set-face global ts_keyword_control_directive
set-face global ts_keyword_control_import "%opt{pink}"
# set-face global ts_keyword_control_repeat
# set-face global ts_keyword_control_return
# set-face global ts_keyword_control_except
set-face global ts_keyword_control_exception "%opt{pink}"
# set-face global ts_keyword_directive
# set-face global ts_keyword_function
# set-face global ts_keyword_operator
# set-face global ts_keyword_special
# set-face global ts_keyword_storage
# set-face global ts_keyword_storage_modifier
# set-face global ts_keyword_storage_modifier_mut
# set-face global ts_keyword_storage_modifier_ref
# set-face global ts_keyword_storage_type
set-face global ts_label "%opt{lightblue}"
set-face global ts_markup_bold "+b"
set-face global ts_markup_heading "%opt{blue}+b"
# set-face global ts_markup_heading_1
# set-face global ts_markup_heading_2
# set-face global ts_markup_heading_3
# set-face global ts_markup_heading_4
# set-face global ts_markup_heading_5
# set-face global ts_markup_heading_6
set-face global ts_markup_heading_marker "%opt{blue}+b"
set-face global ts_markup_italic "+i"
# set-face global ts_markup_list_checked
# set-face global ts_markup_list_numbered
# set-face global ts_markup_list_unchecked
# set-face global ts_markup_list_unnumbered
# set-face global ts_markup_link_label
# set-face global ts_markup_link_url
# set-face global ts_markup_link_uri
set-face global ts_markup_link_text "%opt{orange}"
# set-face global ts_markup_quote
# set-face global ts_markup_raw
# set-face global ts_markup_raw_block
# set-face global ts_markup_raw_inline
set-face global ts_markup_strikethrough "+s"
set-face global ts_namespace "%opt{bluegreen}"
# set-face global ts_operator
set-face global ts_property "%opt{lightblue}"
set-face global ts_punctuation "%opt{fg}"
# set-face global ts_punctuation_bracket
# set-face global ts_punctuation_delimiter
# set-face global ts_punctuation_special
# set-face global ts_special
# set-face global ts_spell
set-face global ts_string "%opt{orange}"
# set-face global ts_string_regex
# set-face global ts_string_regexp
# set-face global ts_string_escape
# set-face global ts_string_special
# set-face global ts_string_special_path
# set-face global ts_string_special_symbol
# set-face global ts_string_symbol
set-face global ts_tag "%opt{blue}"
# set-face global ts_tag_error
set-face global ts_text "%opt{yelloworange}"
# set-face global ts_text_title
set-face global ts_type "%opt{bluegreen}"
# set-face global ts_type_builtin
# set-face global ts_type_enum_variant
set-face global ts_variable "%opt{lightblue}"
# set-face global ts_variable_builtin
# set-face global ts_variable_other_member
# set-face global ts_variable_parameter
set-face global ts_warning "%opt{warning}"

set-face global LineFlagError "%opt{none}"
set-face global LineFlagWarning "%opt{none}"
set-face global LineFlagInfo "%opt{none}"
set-face global LineFlagHint "%opt{none}"

set-face global DiagnosticError ",,%opt{lightred}+c"
set-face global DiagnosticWarning ",,%opt{yellow}+c"
set-face global DiagnosticInfo ",,%opt{blue}+c"
set-face global DiagnosticHint ",,%opt{green}+c"
