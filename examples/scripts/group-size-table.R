make_table = function(){
    # There we preprocess dataset
    groupsize = read.table("group-size.txt", sep="\t", header=T)
    groupsize[groupsize[,3]==0,3]="simple"
    groupsize[groupsize[,3]==1,3]="complex"
    my_caption = paste0("Group sizes for simple and complex ",
                        "hunter-gatherers \\citep{Kelly1995}."
                        )

    names(groupsize) = c("Ethnic group", "group size", "type")
    line_pos = which(groupsize[,3] == "complex")[1]
    complex_index = which(groupsize[,3]=="complex")
    complex_order = order(groupsize[complex_index,2], decreasing=TRUE)

    # you can do fairly complicated stuff, like processing your data
    # here we do simple ordering. If you want to do something more complicated
    # and your data processing is to computaitonally intensive, it is better
    # to preprocess it and than just read and show results.
    simple_index = which(groupsize[,3]=="simple")
    simple_order = order(groupsize[simple_index,2], decreasing=TRUE)

    groupsize[complex_index,] = groupsize[complex_index[complex_order],]
    groupsize[simple_index, ] = groupsize[simple_index[simple_order],]

    # here we utilize package xtable to create latex table. Notice label,
    # caption placement, table placement, booktabs and other setting.
    library(xtable)
    print(xtable(groupsize, caption=my_caption, label="examples:table:group-size"),
                 include.rowname=FALSE,
                 include.colnames=TRUE,
                 caption.placement="top",
                 table.placement="hp",
                 booktabs=TRUE,
                 add.to.row=list(pos=list(line_pos-1),
                                 command=c("\\cmidrule(lr){1-3} ")
                                )
                 )
    }
