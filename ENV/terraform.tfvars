envrg = {
    rg = {
        rgname = "akshrg"
        rglocation = "West Europe"
    }
}
envvn = {
    rg ={
        vnname = "akshvn"
        address_space       = ["10.0.0.0/16"]
        rgname = "akshrg"
        rglocation = "West Europe"
    }
}
envsn = {
    rg = {
        snname = "akshsn"
        rgname = "akshrg"
        vnname = "akshvn"
        address_prefixes = ["10.0.2.0/24"]
    }
}
envni = {
    rg = {
        niname = "akshni"
        rgname = "akshrg"
        rglocation = "West Europe"
        ipname = "akship"
        snname = "akshsn"
        vnname = "akshvn"
        address_allocation = "Dynamic"
        piname = "akshpi"
    }
}
envpi = {
    rg = {
        piname = "akshpi"
        allocation_method = "Static"
        rgname = "akshrg"
        rglocation = "West Europe"
    }
}
envvm = {
    rg = {
        rgname = "akshrg"
        rglocation = "West Europe"
        size       = "Standard_F2"
        admin_username = "akshay123"
        admin_password = "akshay@123"
        vmname = "akshvm7"
    }
}