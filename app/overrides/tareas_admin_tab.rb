Deface::Override.new(virtual_path: "spree/layouts/admin",
                     name: "tareas_admin_tab",
                     insert_bottom: "[data-hook='admin_tabs']",
                     text: "<%= tab(:tareas, :icon => 'icon-file') %>",
                     disabled: false)
