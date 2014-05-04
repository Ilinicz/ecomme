ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do



 
    columns do
      column do
        panel "Recent Orders" do
          table_for Order.limit(10).order("created_at DESC") do 
            column "Order number" do |order|
              link_to order.id, admin_order_path(order)
            end
            column :name
            column "Date", :created_at
          end
        end
      end
    end

  end
end
