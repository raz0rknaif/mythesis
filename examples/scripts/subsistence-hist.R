make_hist = function(){
    data = read.table("subsistence.txt", header=TRUE, sep="\t")
    colors = c(
        rgb(1, 0, 0, 1/4),
        rgb(0, 1, 0, 1/4),
        rgb(0, 0, 1, 1/3)
        )

    hist(data[, 2],
        col = colors[1],
        xlim = c(0, 100),
        border = "white",
        breaks = 10,
        xlab = "percentage of subsistence",
        ylab = "number of societies",

        main = ""
        )

    hist(data[, 3],
        col = colors[2],
        xlim = c(0,100),
        border = "white",
        breaks = 10,
        add = TRUE
        )

    hist(data[, 4],
        col = colors[3],
        xlim = c(0, 100),
        border = "white",
        breaks = 10,
        add = TRUE
        )
    legend(
        "topright",
        legend = c("hunting", "gathering", "fishing"),
        col = "white", 
        fill = colors,
        bty = "n"
        )
    }

