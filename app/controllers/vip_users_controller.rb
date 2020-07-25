class VipUsersController < ApplicationController
   skip_before_action :verify_authenticity_token 

   def show_vip
      sql = "SELECT * FROM `vip_users` WHERE name='#{params[:nickname]}'"
      res = VipUser.connection.execute(sql).to_a.first

      return render json: {vip_group: 'Нет данных', expires: '-'} if res.nil?
      expiration = res.last(2)[1] == 0 ? 'Никогда' : Time.at(res.last(2)[1]).strftime("%d.%m.%Y")
      render json: {vip_group: res.last(2)[0], expires: expiration}
   end
end
