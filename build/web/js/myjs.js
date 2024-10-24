function doLike(postId, userId) {
    $.ajax({
        url: "LikeServlet",
        type: "POST",
        data: {
            operation: "like",
            pid: postId,
            uid: userId
        },
        success: function (data) {
            let likeCounter = $("#like-counter-" + postId);
            let currentLikes = parseInt(likeCounter.text());

            // Ensure the currentLikes doesn't go negative
            if (isNaN(currentLikes)) {
                currentLikes = 0;
            }

            if (data.trim() == "liked") {
                likeCounter.text(currentLikes + 1); // Increment like count
            } else if (data.trim() == "unliked") {
                if (currentLikes > 0) {
                    likeCounter.text(currentLikes - 1); // Decrement like count
                }
            } else {
                console.error("Error: ", data);
            }
        },
        error: function (xhr, status, error) {
            console.error("Error: " + error);
        }
    });
}
