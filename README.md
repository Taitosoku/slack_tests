# file visibility
```
=begin
This test file  is the skeleton test plan for file visibility/n

=end
require './spec_helper'/n

describe 'file', :type => :feature do
  it 'is visible on the messages board' do
    it 'is visible by the whole team'
      it 'is visible by any individual team member'
        # log in as at least 3 different team members of different permission levels
      end
      it 'is visible by channel owner' do

      end
      it 'is visible by file uploader' do

      end
    end
    it 'is visible by private channel members' do
      it 'is visible by invited members' do

      end
      it 'is visible by file uploader' do

      end
      it 'is not visible by uninvited team members' do

      end
      it 'is not visible to members in another private channel' do

      end
    end
    it 'is visible in a DM group' do
      it 'is visible by file uploader' do

      end
      it 'is visible by invited members' do

      end
      it 'is not visible by uninvited team members' do

      end
    end
    it 'is visible to DM pair only' do
      it 'is visible to file uploader' do

      end
      it 'is visible to direct person sent message' do

      end
      it 'is not visible to anyone else' do
        it 'not person in public channel' do

        end
        it 'not person in private channel' do

        end
        it 'not person in group DM' do

        end
        it 'not another person the file sharer is currently DMing' do

        end
      end
    end
    it 'uploaded but not shared' do
      it 'is visible to file uploader' do

      end
      it 'not visible to anyone else' do

      end
    end
  end
  # now repeat above with areas below
  it 'is visible in the search container' do

  end
  it 'is visible in channel details' do

  end
end
```
