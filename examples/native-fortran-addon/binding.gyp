{
    "targets": [
        {
            "target_name": "times",
            "sources": [ "times-cc.cc" ],
            "link_settings": {
                "libraries": [ "<!@(make -s)" ]
            },
            "include_dirs": [
                "<!(node -e \"require('nan')\")"
            ]
        }
    ]
}
