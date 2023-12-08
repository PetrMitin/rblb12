require_relative '../helpers/authomorph_numbers_helper.rb'
require_relative '../models/authomorph.rb'

class AuthomorphNumbersController < ApplicationController
  before_action :authenticate_user!
  include AuthomorphNumbersHelper
  def input
  end

  def view
    n = params[:n]
    if !params[:n].scan(/[^+\d|\-]/).empty?
      @error = 'Input contains letters'
    elsif n.to_i <= 0
      @error = 'N <= 0'
    end
    n = n.to_i
    records = Authomorph.where(n: n)
    print records
    if records.empty?
      @results = ((1..n).select { |i| authomorph_number?(i) }).to_a
      @results = @results.map { |result| Authomorph.create(n: n, value: result, square: result**2) }
      respond_to do |format|
        format.html
        format.json do
          render json:
            {n: n, results: @results, error: @error, from_db: false}
          end
        end 
    else
      respond_to do |format|
        format.html
        format.json do
          render json:
            {n: n, results: records, error: @error, from_db: true}
        end
      end
    end 
  end
end
