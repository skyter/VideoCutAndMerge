@echo off
echo %1
for /r %1 %%g in (*.avi) do (
	echo ���� %%g �� %%~ng.AVI
	echo ffmpeg -i %%g -acodec copy -vcodec copy -async 1 %%~ng.AVI
	ffmpeg -i %%g -acodec copy -vcodec copy -async 1 %%~ng.AVI
)