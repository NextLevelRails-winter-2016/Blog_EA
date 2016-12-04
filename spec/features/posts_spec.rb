require 'rails_helper'

feature 'posts/index' do
    scenario 'renders a list of posts' do
        user = create(:user_with_posts)
        sign_in(user)

        create(:post)

        visit posts_path

        expect(page).to have_content('How to make bacon')
    end
end

feature 'New Post' do
    scenario 'user adds a new post' do
        user = create(:user)
        sign_in(user)

        visit posts_path

        expect do
            click_link 'New Post'
            fill_in 'Title', with: 'Rspec Information'
            fill_in 'Article', with: 'Here is some information about how Rspec works'
            select(user.email, from: 'post_user_id')
            click_button('Create Post')
        end.to change(Post, :count).by(1)

        expect(current_path).to eq(post_path(Post.last.id))
        expect(page).to have_content('Rspec Information')
    end
end

feature 'Edit Post' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }

    scenario 'User edits post' do
        sign_in(user)
        visit post_path(post)
        expect(page).to have_content('How to make bacon')

        click_link('Edit')

        fill_in 'Title', with: 'All About Cats'
        fill_in 'Article', with: 'This article includes everyhting you would ever want to know about cats'
        select(post.user.email, from: 'post_user_id')

        click_button('Update Post')

        expect(current_path).to eq(post_path(post.id))

        expect(page).to have_content('All About Cats')
    end
end
