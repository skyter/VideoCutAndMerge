@echo off
echo %1
for /r %1 %%g in (*.avi) do (
	echo л■ий %%g ж▄ %%~ng.AVI
	echo ffmpeg -i %%g -acodec copy -vcodec copy -async 1 %%~ng.AVI
	ffmpeg -i %%g -acodec copy -vcodec copy -async 1 %%~ng.AVI
)