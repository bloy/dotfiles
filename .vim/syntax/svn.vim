" Vim syntax file
" Language:	SVN commit file
" Maintainer:	Leandro Lucarella (luca@lugmen.org.ar)
" URL:		http://www.lugmen.org.ar/~luca/svn.vim
" Last Change:	sáb ago 10 14:32:22 ART 2002

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

"syn region svnLine start="^SVN:" end="$" contains=svnFile,svnCom,svnFiles,svnTag
syn region svnLine start="^SVN:" end="$" contains=svnFile,svnFiles
syn match svnFile  contained "\(/[^/]\+\)\+"
"syn match svnTag   contained " Tag:"
syn match svnFiles contained "\(_\|A\|M\|D\)\+\s\+\(/[^/]\)\+" contains=svnFile
"syn region svnCom start="Committing in" end="$" contains=svnDir contained extend keepend
"syn match svnDir   contained "\S\+$"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_svn_syn_inits")
	if version < 508
		let did_svn_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink svnLine		Comment
"	HiLink svnDir		svnFile
	HiLink svnFile		Constant
	HiLink svnFiles		Statement
"	HiLink svnFiles		svnCom
"	HiLink svnTag		svnCom
"	HiLink svnCom		Statement

	delcommand HiLink
endif

let b:current_syntax = "svn"
