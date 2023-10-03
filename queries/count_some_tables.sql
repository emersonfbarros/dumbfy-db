SELECT
  (SELECT COUNT(*) FROM dumbfy.song) AS songs,
  (SELECT COUNT(*) FROM dumbfy.artist) AS artists,
  (SELECT COUNT(*) FROM dumbfy.album) AS albums;
