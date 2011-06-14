class HomeController < ApplicationController
SPEAKERS =   [{:email => 'andrec@checkplant.com.br', :name => 'André Cantarelli & Frederico Fonseca', :company => 'checkplant.com.br'},
  {:email => 'ccarneiroj@gmail.com', :name => 'Cloves Carneiro', :company => 'amazon.com'},
  {:email => 'danicuki@gmail.com', :name => 'Daniel Cukier', :company => 'usp'},
  {:email => 'daniel@egenial.com.br', :name => 'Daniel Lopes', :company => 'objetiva.co'},
  {:email => 'diego@cuboxsa.com', :name => 'Diego Algorta*', :company => 'cubox.com.uy'},
  {:email => 'everton.carpes@gmail.com', :name => 'Éverton Carpes', :company => 'globo.com'},
  {:email => 'fabioakita@gmail.com', :name => 'Fábio Akita', :company => 'gonow.com.br'},
  {:email => 'felipe.lima@gmail.com', :name => 'Felipe Lima', :company => 'thoughtworks.com'},
  {:email => 'nicolas@quavio.com.br', :name => 'Nícolas Iensen', :company => 'quavio.com.br'},
  {:email => 'rafael.lima@bielsystems.com.br', :name => 'Rafael Lima', :company => 'bielsystems.com.br'},
  {:email => 'rafael.ssouza@gmail.com', :name => 'Rafael Souza', :company => 'softa.com.br'},
  {:email => '', :name => 'Rodrigo Flores', :company => 'plataformatec.com.br'},
  {:email => 'gabriel.sobrinho@gmail.com', :name => 'Gabriel Sobrinho', :company => ''},
  {:email => '', :name => 'Thais Camilo', :company => 'hashrocket.com'}]

  def index
    @speakers = SPEAKERS
  end

end