class Boolio < ActiveRecord::Base

  # callbacks to interact with booleans API
  before_create :create_baas
  before_save :update_baas
  before_destroy :destroy_baas

  @@base_url = 'https://api.booleans.io'

  def verify_with_api

    response = HTTParty.get( @@base_url + '/' + self.api_id )

    unless response.code == 200
      return false
    end

    attributes = JSON.parse response.body

    unless attributes['val'] != self.val
      # make sure we are in sync w/ the API service
      self.update(
        val: attributes['val']
      )
    end
  end

  private
    # create boolean via REST interface
    def create_baas

      # create boolean
      response = HTTParty.post( @@base_url,
        body: { val: self.val }
      )

      # Return false if unsuccessful
      unless response.code == 200
        return false
      end

      self.assign_attributes(
        api_id: response['id']
      )

      true
    end

    def update_baas

      # only want to check on existing items
      return true if self.new_record?

      # update boolean
      response = HTTParty.put( @@base_url + '/' + self.api_id,
        body: { val: self.val }
      )

      # Return false if unsuccessful
      response.code == 200

    end

    def destroy_baas

      # Destroy boolean
      response = HTTParty.delete( @@base_url + '/' + self.api_id )

      # Return false if unsuccessful
      response.code == 200

    end

end
