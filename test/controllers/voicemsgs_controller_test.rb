require 'test_helper'

class VoicemsgsControllerTest < ActionController::TestCase
  setup do
    @voicemsg = voicemsgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voicemsgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create voicemsg" do
    assert_difference('Voicemsg.count') do
      post :create, voicemsg: { patient_id: @voicemsg.patient_id, physician: @voicemsg.physician, voice: @voicemsg.voice }
    end

    assert_redirected_to voicemsg_path(assigns(:voicemsg))
  end

  test "should show voicemsg" do
    get :show, id: @voicemsg
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @voicemsg
    assert_response :success
  end

  test "should update voicemsg" do
    patch :update, id: @voicemsg, voicemsg: { patient_id: @voicemsg.patient_id, physician: @voicemsg.physician, voice: @voicemsg.voice }
    assert_redirected_to voicemsg_path(assigns(:voicemsg))
  end

  test "should destroy voicemsg" do
    assert_difference('Voicemsg.count', -1) do
      delete :destroy, id: @voicemsg
    end

    assert_redirected_to voicemsgs_path
  end
end
