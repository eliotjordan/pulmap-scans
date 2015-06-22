UPDATE images
SET
      publisher = (SELECT images2.Publisher
                            FROM images2
                            WHERE images2.idImage = images.id )
WHERE
    EXISTS (
        SELECT *
        FROM images2
        WHERE images2.idImage = images.id
    )