require 'rails_helper'

describe PostsController do
  render_views

  describe 'get #index' do
    before :each do
      @post = create(:post)
    end

    #context 'Collection de posts en vble @posts' do
    it 'returns a collection in @posts' do
      get :index
      expect(assigns(:posts)).to include(@post)
    end

    it 'renders :index view' do
      get :index
      expect(response).to render_template :index
    end
  end
  describe 'get #show' do
    before :each do
      @post = create(:post)
    end
    it 'returns an object in @posts' do
      get :show, id: @post
      expect(assigns(:post)).to eq @post
    end
    it 'renders :show view' do
      get :show, id: @post
      expect(response).to render_template :show
    end
  end

  describe 'get #edit' do
    before :each do
      @post = create(:post)
    end
    it 'returns an object in @post' do
      get :edit, id: @post
      expect(assigns(:post)).to eq @post
    end
    it 'renders :edit view' do
      get :edit, id: @post
      expect(response).to render_template :edit
    end
  end

  describe 'post #new' do
    it 'returns an object in @post' do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
    it 'renders :new view' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'post #create' do
    context 'With valid data' do
      it 'it saves post to DB' do
        expect {
          post :create, post: attributes_for(:post)
        }.to change(Post, :count).by(1)
      end
      it 'it redirects to :show view' do
        post :create, post: attributes_for(:post)
        expect(response).to redirect_to post_path(assigns(:post))
      end
    end

    context 'With invalid data' do
      it 'does not save a record in database' do
        expect {
          post :create, post: attributes_for(:post_invalid, author: nil)
        }.not_to change(Post, :count)
      end

      it 'redirects to :new view' do
        post :create, post: attributes_for(:post_invalid)
        expect(response).to render_template :new
      end
    end
  end

  describe 'patch #update' do
    before :each do
      @post = create(:post)
    end
    context 'With valid data' do
      it 'must update post record in database' do
        patch :update, id: @post, post: attributes_for(:post, author: 'The peter')
        @post.reload
        expect(@post.author).to eq 'The peter'
      end
      it 'must redirect to :show view' do
        patch :update, id: @post, post: attributes_for(:post, author: 'The peter')
        expect(response).to redirect_to post_path(@post)
      end

    end

    context 'With invalid data' do
      it 'does not save a record in database' do
        patch :update, id: @post, post: attributes_for(:post_invalid)
        @post.reload
        expect(@post.author).not_to eq nil
      end

      it 'must render :edit view' do
        patch :update, id: @post, post: attributes_for(:post_invalid)
        @post.reload
        expect(response).to render_template :edit
      end
    end
  end

  describe 'destroy #destroy' do
    before :each do
      @post = create(:post)
    end
    it 'must destroy post record' do
      expect {
        delete :destroy, id: @post
      }.to change(Post, :count).by(-1)
    end

    it 'must redirect to :index view' do
      delete :destroy, id: @post
      expect(response).to redirect_to posts_path
    end
  end
end
