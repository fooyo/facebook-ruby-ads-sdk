module FacebookAds
  # Ad ad creative has many ad images and belongs to an ad account.
  # https://developers.facebook.com/docs/marketing-api/reference/ad-creative
  class AdCreative < Base
    FIELDS               = %w(id name object_story_id object_story_spec object_type thumbnail_url run_status).freeze
    CALL_TO_ACTION_TYPES = %w(OPEN_LINK LIKE_PAGE SHOP_NOW PLAY_GAME INSTALL_APP USE_APP INSTALL_MOBILE_APP USE_MOBILE_APP BOOK_TRAVEL LISTEN_MUSIC LEARN_MORE SIGN_UP DOWNLOAD WATCH_MORE NO_BUTTON CALL_NOW APPLY_NOW BUY_NOW GET_OFFER GET_OFFER_VIEW GET_DIRECTIONS MESSAGE_PAGE MESSAGE_USER SUBSCRIBE SELL_NOW DONATE_NOW GET_QUOTE CONTACT_US RECORD_NOW VOTE_NOW REGISTER_NOW REQUEST_TIME SEE_MENU OPEN_MOVIES).freeze

    class << self
      def photo(name:, page_id:, instagram_actor_id: nil, message:, link:, link_title:, description:, image_hash:, call_to_action_type:)
        object_story_spec = {
          'page_id' => page_id, # 300664329976860
          'instagram_actor_id' => instagram_actor_id, # 503391023081924
          'link_data' => {
            'link' => link, # https://tophatter.com/, https://itunes.apple.com/app/id619460348, http://play.google.com/store/apps/details?id=com.tophatter
            'message' => message,
            'description' => description,
            'image_hash' => image_hash,
            'call_to_action' => {
              'type' => call_to_action_type,
              'value' => {
                # 'application' =>,
                'link' => link,
                'link_title' => link_title
              }
            }
          }
        }
        {
          name: name,
          object_story_spec: object_story_spec.to_json
        }
      end

      # https://developers.facebook.com/docs/marketing-api/guides/videoads
      def carousel(name:, page_id:, instagram_actor_id: nil, link:, message:, assets:, call_to_action_type:, multi_share_optimized:, multi_share_end_card:)
        object_story_spec = {
          'page_id' => page_id, # 300664329976860
          'instagram_actor_id' => instagram_actor_id, # 503391023081924
          'link_data' => {
            'link' => link, # https://tophatter.com/, https://itunes.apple.com/app/id619460348, http://play.google.com/store/apps/details?id=com.tophatter
            'message' => message,
            'call_to_action' => { 'type' => call_to_action_type },
            'child_attachments' => assets.collect do |asset|
              {
                'link' => link,
                'image_hash' => asset[:hash],
                'name' => asset[:title],
                # 'description' => asset[:title],
                'call_to_action' => { 'type' => call_to_action_type } # Redundant?
              }
            end,
            'multi_share_optimized' => multi_share_optimized,
            'multi_share_end_card' => multi_share_end_card
          }
        }


        {
          name: name,
          object_story_spec: object_story_spec.to_json
        }
      end

      def product_set(name:, page_id:, link:, message:, headline:, description:, product_set_id:)
        { name: name,
          object_story_spec: {
            page_id: page_id,
            template_data: {
              description: description,
              link: link,
              message: message,
              name: headline
            }
          },
          template_url: link,
          product_set_id: product_set_id
        }
      end
    end
  end
end
