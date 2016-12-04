require 'rails_helper'

RSpec.describe PostsController, type: :controller do
    before { sign_in(create(:user)) }

    describe 'unathenticated' do
        it 'redirects user to login page when not signed in' do
            sign_out(:user)
            get :index
            expect(response).to redirect_to(new_user_session_path)
        end
    end
    describe 'GET #index' do
        it 'renders the index template' do
            get :index
            expect(response).to render_template(:index)
        end

        it 'returns all posts for current user' do
            user = create(:user_with_posts)
            post = create(:post)

            sign_in(user)

            get :index
            expect(Post.all.length).to eq(2)
            expect(assigns(:posts).length).to eq(1)
        end
    end
end
