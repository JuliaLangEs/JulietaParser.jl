function _precompile_()
    ccall(:jl_generating_output, Cint, ()) == 1 || return nothing

    code = readstring(Pkg.dir("JuliaParser","src","parser.jl"))
    buf = IOBuffer(code)
    ts = Lexer.TokenStream{Tokens.Token}(buf)
    while !Lexer.eof(ts); Parser.parse(ts); end
    seekstart(buf)
    ts = Lexer.TokenStream{Tokens.SourceLocToken}(buf)
    while !Lexer.eof(ts); Parser.parse(ts); end

    precompile(JuliaParser.Parser.parse_resword, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, JuliaParser.Tokens.SourceLocToken, Void,))
    precompile(JuliaParser.LineNumbers.Type, (Type{JuliaParser.LineNumbers.SourceFile}, ASCIIString,))
    precompile(JuliaParser.Parser.not_eof_1, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser._parse_atom, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_call_chain, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, JuliaParser.Tokens.SourceExpr, Bool,))
    precompile(JuliaParser.LineNumbers.compute_line, ( JuliaParser.LineNumbers.SourceFile, UInt32,))
    precompile(JuliaParser.Lexer.isuws, ( Char,))
    precompile(JuliaParser.Tokens.expr_append!, ( JuliaParser.Tokens.SourceExpr, Tuple{JuliaParser.Tokens.SourceExpr},))
    precompile(JuliaParser.Lexer.disallow_dot!, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Array{Char, 1}, JuliaParser.Tokens.SourceRange,))
    precompile(JuliaParser.Parser.parse_call_chain, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, JuliaParser.Tokens.SourceLocToken, Bool,))
    precompile(JuliaParser.Parser.parse_block, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Any,))
    precompile(JuliaParser.Parser.parse_Nary, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_eq), Base.Set{Char}, Symbol, Base.Set{Symbol}, Bool, Void,))
    precompile(JuliaParser.Lexer.is_cat_id_start, ( Char, Int32,))
    precompile(JuliaParser.Lexer.read_number, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Bool, Bool,))
    precompile(JuliaParser.Parser._parse_arglist, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Char, Void,))
    precompile(JuliaParser.Parser.not_eof_3, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_comma_sep, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_eqs),))
    precompile(JuliaParser.LineNumbers.Type, (Type{JuliaParser.LineNumbers.SourceFile}, UTF8String,))
    precompile(JuliaParser.Parser.parse_iteration_spec, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Parser.parse_import_dots, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Tokens.expr_append!, ( JuliaParser.Tokens.SourceExpr, JuliaParser.Tokens.SourceExpr,))
    precompile(JuliaParser.Tokens.expr_append!, ( JuliaParser.Tokens.SourceExpr, Tuple{},))
    precompile(JuliaParser.Parser.separate, (typeof( JuliaParser.Parser.is_parameter), Array{Any, 1},))
    precompile(JuliaParser.Parser.parse_Nary, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_cond), Base.Set{Char}, Symbol, Base.Set{Any}, Bool, Void,))
    precompile(JuliaParser.Parser.to_kws, ( Array{Any, 1},))
    precompile(JuliaParser.Parser.parse_range, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_space_separated_exprs, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_RtoL, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Any, Base.Set{Symbol}, JuliaParser.Tokens.SourceExpr,))
    precompile(JuliaParser.LineNumbers.getindex, ( JuliaParser.LineNumbers.SourceFile, Int64,))
    precompile(JuliaParser.Parser.parse_assignment, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_cond),))
    precompile(JuliaParser.Lexer.utf8sizeof, ( Char,))
    precompile(JuliaParser.Lexer.require_token, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Bool,))
    precompile(JuliaParser.Diagnostics.diag, ( JuliaParser.Diagnostics.Diagnostic, JuliaParser.Tokens.SourceRange, ASCIIString,))
    precompile(JuliaParser.Parser.parse_LtoR, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_arrow), Base.Set{Symbol},))
    precompile(JuliaParser.Parser._parse_arglist, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Char, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Tokens.expr_append!, ( JuliaParser.Tokens.SourceExpr, Array{Any, 1},))
    precompile(JuliaParser.Parser.parse_Nary, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Any, Base.Set{Char}, Symbol, Base.Set{Any}, Bool,))
    precompile(JuliaParser.Diagnostics.normalize_loc, ( JuliaParser.Tokens.SourceRange,))
    precompile(JuliaParser.Parser.not_eof_2, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Lexer.is_identifier_char, ( Char,))
    precompile(JuliaParser.Tokens.expr_append!, ( JuliaParser.Tokens.SourceExpr, Array{JuliaParser.Tokens.SourceExpr, 1},))
    precompile(JuliaParser.Parser.parse_assignment, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Any, JuliaParser.Tokens.SourceExpr,))
    precompile(JuliaParser.Tokens.expr_append!, ( JuliaParser.Tokens.SourceExpr, Tuple{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Tokens.expr_append!, ( JuliaParser.Tokens.SourceExpr, Tuple{JuliaParser.Tokens.SourceExpr, JuliaParser.Tokens.SourceExpr},))
    precompile(JuliaParser.Lexer.next_token, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Bool,))
    precompile(JuliaParser.Parser._parse_string_literal, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Symbol, Int64, Bool,))
    precompile(JuliaParser.Parser.parse_unary, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_string_literal, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Bool,))
    precompile(JuliaParser.Tokens.merge, ( JuliaParser.Tokens.SourceNode, JuliaParser.Tokens.SourceNode,))
    precompile(JuliaParser.Parser.macroify_name, ( JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Parser.short_form_function_loc, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, JuliaParser.Tokens.SourceExpr, Int64, Symbol,))
    precompile(JuliaParser.Parser.parse_Nary, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Any, Base.Set{Char}, Symbol, Base.Set{Symbol}, Bool,))
    precompile(JuliaParser.Parser.expect_end, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Tokens.val, ( LineNumberNode,))
    precompile(JuliaParser.Parser.short_form_function_loc, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, JuliaParser.Tokens.SourceLocToken, Int64, Symbol,))
    precompile(JuliaParser.Parser.is_closing_token, ( JuliaParser.Parser.ParseState, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Tokens.merge, ( JuliaParser.Tokens.SourceRange, JuliaParser.Tokens.SourceRange,))
    precompile(JuliaParser.Tokens.make_zip, ( JuliaParser.Tokens.SourceExpr,))
    precompile(JuliaParser.Parser.parse_juxtaposed, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Tokens.merge, ( JuliaParser.Tokens.SourceRange, JuliaParser.Tokens.SourceNode,))
    precompile(JuliaParser.Parser.is_juxtaposed, ( JuliaParser.Parser.ParseState, JuliaParser.Tokens.SourceExpr, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Lexer.peekchar, ( Base.AbstractIOBuffer{Array{UInt8, 1}},))
    precompile(JuliaParser.Parser.parse_LtoR, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_range), Base.Set{Symbol}, JuliaParser.Tokens.SourceExpr,))
    precompile(JuliaParser.Parser.is_juxtaposed, ( JuliaParser.Parser.ParseState, JuliaParser.Tokens.SourceLocToken, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Parser.parse_LtoR, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_term), Base.Set{Symbol}, JuliaParser.Tokens.SourceExpr,))
    precompile(JuliaParser.Parser.tostr, ( Base.AbstractIOBuffer{Array{UInt8, 1}}, Bool,))
    precompile(JuliaParser.Parser.parse_LtoR, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_range), Base.Set{Symbol}, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Parser.parse_comparison, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Base.Set{Symbol},))
    precompile(JuliaParser.Parser.parse_LtoR, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_unary), Base.Set{Symbol}, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Parser.parse_LtoR, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_term), Base.Set{Symbol}, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Parser.parse_LtoR, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_unary), Base.Set{Symbol}, JuliaParser.Tokens.SourceExpr,))
    precompile(JuliaParser.Parser.arglist_to_tuple, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Bool, Bool, Array{Any, 1}, Tuple{},))
    precompile(JuliaParser.Lexer.readchar, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_RtoL, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Any, Base.Set{Symbol}, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Parser.parse_assignment, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Any, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Parser.parse_import, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Parser.parse_cond, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_backquote, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_comma_sep, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_unary_prefix),))
    precompile(JuliaParser.Parser.parse_juxtaposed, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, JuliaParser.Tokens.SourceExpr,))
    precompile(JuliaParser.Parser.subtype_syntax, ( JuliaParser.Tokens.SourceExpr,))
    precompile(JuliaParser.LineNumbers.compute_line, ( JuliaParser.LineNumbers.SourceFile, UInt64,))
    precompile(JuliaParser.Parser.parse_decl, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.add_filename_to_block!, ( JuliaParser.Tokens.SourceExpr, LineNumberNode,))
    precompile(JuliaParser.Parser.subtype_syntax, ( JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Parser.parse_imports, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Parser.parse_with_chains, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_rational), Base.Set{Symbol}, Symbol,))
    precompile(JuliaParser.Parser.parse_with_chains, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_shift), Base.Set{Symbol}, Symbol,))
    precompile(JuliaParser.Lexer.take_token, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.is_doc_string_literal, ( JuliaParser.Tokens.SourceExpr,))
    precompile(JuliaParser.Parser.parse_factorh, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_unary), Base.Set{Symbol},))
    precompile(JuliaParser.Lexer.peek_token, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Bool,))
    precompile(JuliaParser.Parser.parse_arrow, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_atom, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Lexer.read_operator, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Char, Int64,))
    precompile(JuliaParser.Lexer.is_zero_width_space, ( Char,))
    precompile(JuliaParser.Lexer.accum_julia_symbol, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Char,))
    precompile(JuliaParser.Parser.parse_or, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_docstring, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_eq),))
    precompile(JuliaParser.Tokens.merge, ( JuliaParser.Tokens.SourceExpr, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Lexer.skip_multiline_comment, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Int64,))
    precompile(JuliaParser.Parser.parse_comma_sep_iters, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Tokens.merge, ( Expr, JuliaParser.Tokens.SourceRange,))
    precompile(JuliaParser.Parser.parse_arglist, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Char, Void,))
    precompile(JuliaParser.Parser.parse_stmts, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_interpolate, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, JuliaParser.Tokens.SourceRange, JuliaParser.Tokens.SourceRange,))
    precompile(JuliaParser.Parser.parse_call, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_arglist, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Char, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Lexer.make_token, ( Type{JuliaParser.Tokens.SourceLocToken}, Symbol, Int64, Int64,))
    precompile(JuliaParser.Tokens.merge, ( JuliaParser.Tokens.SourceLocToken, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Parser.parse_unary_prefix, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.is_invalid_initial_token, ( Symbol,))
    precompile(JuliaParser.Lexer.is_syntactic_unary_op, ( Symbol,))
    precompile(JuliaParser.Parser.is_invalid_initial_token, ( Char,))
    precompile(JuliaParser.Tokens.normalize, ( JuliaParser.Tokens.SourceNode,))
    precompile(JuliaParser.Lexer.is_operator, ( Symbol,))
    precompile(JuliaParser.Parser.parse, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Tokens.Type, (Type{JuliaParser.Tokens.SourceNode}, JuliaParser.Tokens.SourceRange, Array{JuliaParser.Tokens.SourceNode, 1},))
    precompile(JuliaParser.Tokens.Type, (Type{JuliaParser.Tokens.SourceLocToken}, Symbol, JuliaParser.Tokens.SourceRange,))
    precompile(JuliaParser.Lexer.skipws, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, Bool,))
    precompile(JuliaParser.Lexer.set_token!, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Parser.parse_resword, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken}, JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Tokens.Type, (Type{JuliaParser.Tokens.SourceNode}, JuliaParser.Tokens.SourceNode,))
    precompile(JuliaParser.Tokens.normalize, ( JuliaParser.Tokens.SourceRange,))
    precompile(JuliaParser.Lexer.isnewline, ( JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Lexer.eof, ( JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Lexer.is_operator, ( Char,))
    precompile(JuliaParser.Lexer.isnewline, ( Char,))
    precompile(JuliaParser.Tokens.val, ( JuliaParser.Tokens.SourceLocToken,))
    precompile(JuliaParser.Tokens.Type, (Type{JuliaParser.Tokens.SourceRange}, UInt32, UInt32, UInt8,))
    precompile(JuliaParser.Lexer.is_operator, ( Expr,))
    precompile(JuliaParser.Tokens.val, ( JuliaParser.Tokens.SourceExpr,))
    precompile(JuliaParser.Tokens.Type, (Type{JuliaParser.Tokens.SourceExpr}, Symbol, JuliaParser.Tokens.SourceNode,))
    precompile(JuliaParser.LineNumbers.getindex, ( JuliaParser.LineNumbers.SourceFile, Base.UnitRange{Int64},))
    precompile(JuliaParser.Parser.parse_factorh, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_decl), Base.Set{Symbol},))
    precompile(JuliaParser.Tokens.Type, (Type{JuliaParser.Tokens.SourceExpr}, LineNumberNode, JuliaParser.Tokens.SourceNode,))
    precompile(JuliaParser.Tokens.Type, (Type{JuliaParser.Tokens.SourceExpr}, Expr, JuliaParser.Tokens.SourceNode,))
    precompile(JuliaParser.Tokens.children, ( JuliaParser.Tokens.SourceNode,))
    precompile(JuliaParser.Diagnostics.before, ( JuliaParser.Tokens.SourceRange,))
    precompile(JuliaParser.Parser.parse_eqs, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Lexer.skipcomment, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Lexer.eof, ( Char,))
    precompile(JuliaParser.Lexer.eof, ( Symbol,))
    precompile(JuliaParser.Lexer.isnewline, ( Symbol,))
    precompile(JuliaParser.Parser.parse_eq, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_RtoL, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_and), Base.Set{Symbol},))
    precompile(JuliaParser.Parser.parse_LtoR, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_range), Base.Set{Symbol},))
    precompile(JuliaParser.Lexer.skipws_and_comments, ( JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_RtoL, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_or), Base.Set{Symbol},))
    precompile(JuliaParser.Parser.parse_LtoR, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_unary), Base.Set{Symbol},))
    precompile(JuliaParser.Parser.parse_LtoR, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_pipes), Base.Set{Symbol},))
    precompile(JuliaParser.Parser.parse_LtoR, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_term), Base.Set{Symbol},))
    precompile(JuliaParser.Parser.parse_RtoL, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_comparison), Base.Set{Symbol},))
    precompile(JuliaParser.Parser.parse_comma, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_term, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_expr, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_assignment, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},typeof( JuliaParser.Parser.parse_comma),))
    precompile(JuliaParser.Lexer.is_ignorable_char, ( Char,))
    precompile(JuliaParser.Parser.parse_pipes, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_comparison, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_factor, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_in, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_rational, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Parser.parse_shift, ( JuliaParser.Parser.ParseState, JuliaParser.Lexer.TokenStream{JuliaParser.Tokens.SourceLocToken},))
    precompile(JuliaParser.Lexer.is_identifier_start_char, ( Char,))

    nothing
end
