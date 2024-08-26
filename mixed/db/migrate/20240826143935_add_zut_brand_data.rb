# frozen_string_literal: true

#
# Copyright (C) 2020 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.

class AddZutBrandData < ActiveRecord::Migration[7.0]
  tag :predeploy

  def up
    # all we want in the test env is the dummy root account and the default shard
    # everything else will get truncated anyway
    return if Rails.env.test?

    create_zut_theme
  end

  def create_zut_theme
    create_theme("zut 默认主题", {
                "ic-brand-primary" => "#2773E2",
                "ic-link-color" => "#1d6adb",
                "ic-brand-button--secondary-bgd" => "#4d4d4d",
                "ic-brand-global-nav-bgd" => "#f2f2f2",
                "ic-brand-global-nav-ic-icon-svg-fill" => "#2773e2",
                "ic-brand-global-nav-menu-item__text-color" => "#444444",
                "ic-brand-global-nav-avatar-border" => "#444444",
                "ic-brand-global-nav-logo-bgd" => "#ffffff",
                "ic-brand-header-image" => "/dist/brand_assets/zut/icon-256x256_thumb.jpeg",
                "ic-brand-mobile-global-nav-logo" => "/dist/brand_assets/zut/logo.png",
                "ic-brand-watermark-opacity" => '0.7',
                "ic-brand-favicon" => "/dist/brand_zut/favicon.ico",
                "ic-brand-apple-touch-icon" => "/dist/brand_assets/zut/logo_hov.png",
                "ic-brand-msapplication-tile-square" => "/dist/brand_assets/zut/logo_hov.png",
                "ic-brand-msapplication-tile-wide" => "/dist/brand_assets/zut/logo.png",
                "ic-brand-Login-body-bgd-color" => "#f2f2f2",
                "ic-brand-Login-body-bgd-shadow-color" => "#f2f2f2",
                "ic-brand-Login-logo" => "/dist/brand_assets/zut/logo_hov.png",
                "ic-brand-Login-Content-bgd-color" => "#ffffff",
                "ic-brand-Login-Content-border-color" => "#efefef",
                "ic-brand-Login-Content-label-text-color" => "#444444",
                "ic-brand-Login-Content-password-text-color" => "#444444",
                "ic-brand-Login-footer-link-color" => "#aaaaaa",
                "ic-brand-Login-instructure-logo" => "#aaaaaa"
    })
  end



  def create_theme(name, variables)
    bc = BrandConfig.create!(name:, variables:, share: true)
    SharedBrandConfig.create!(name: bc.name, brand_config_md5: bc.md5)
  end


  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
