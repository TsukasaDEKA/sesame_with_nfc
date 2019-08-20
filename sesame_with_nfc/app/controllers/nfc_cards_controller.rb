class NfcCardsController < ApplicationController
  before_action :set_nfc_card, only: [:show, :edit, :update, :destroy]

  # GET /nfc_cards
  # GET /nfc_cards.json
  def index
    @nfc_cards = NfcCard.all
  end

  # GET /nfc_cards/1
  # GET /nfc_cards/1.json
  def show
  end

  # GET /nfc_cards/new
  def new
    @nfc_card = NfcCard.new
  end

  # GET /nfc_cards/1/edit
  def edit
  end

  # POST /nfc_cards
  # POST /nfc_cards.json
  def create
    @nfc_card = NfcCard.new(nfc_card_params)

    respond_to do |format|
      if @nfc_card.save
        format.html { redirect_to @nfc_card, notice: 'Nfc card was successfully created.' }
        format.json { render :show, status: :created, location: @nfc_card }
      else
        format.html { render :new }
        format.json { render json: @nfc_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nfc_cards/1
  # PATCH/PUT /nfc_cards/1.json
  def update
    respond_to do |format|
      if @nfc_card.update(nfc_card_params)
        format.html { redirect_to @nfc_card, notice: 'Nfc card was successfully updated.' }
        format.json { render :show, status: :ok, location: @nfc_card }
      else
        format.html { render :edit }
        format.json { render json: @nfc_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nfc_cards/1
  # DELETE /nfc_cards/1.json
  def destroy
    @nfc_card.destroy
    respond_to do |format|
      format.html { redirect_to nfc_cards_url, notice: 'Nfc card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nfc_card
      @nfc_card = NfcCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nfc_card_params
      params.require(:nfc_card).permit(:user_id, :name, :uid, :password, :is_activated)
    end
end
