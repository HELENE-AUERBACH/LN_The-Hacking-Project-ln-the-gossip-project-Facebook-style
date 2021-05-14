class UsersController < ApplicationController
  def index
    # Méthode qui récupère tous les utilisateurs et les envoie à la view index (index.html.erb) pour affichage
    @users = User.all
    puts "$" * 60
    puts "Voici le nombre d'utilisateurs dans la base : #{@users.length}"
    puts "$" * 60
  end

  def show
    # Méthode qui récupère l'utilisateur concerné et l'envoie à la view show (show.html.erb) pour affichage
    @user_hash = get_user_hash
  end

  def new
    # Méthode qui crée un utilisateur vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @new_user = User.new
  end

  def create
    # Méthode qui créé un utilisateur à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher l'utilisateur créé)
    puts "$" * 60
    puts "Salut, je suis dans le serveur pour une création"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ email : #{params["email"]}"
    puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ password : #{params["password"]}"
    @user = User.new("first_name" => params[:first_name],
                     "last_name" => params[:last_name],
                     "description" => params[:description],
                     "email" => params[:email],
                     "age" => params[:age],
                     "password" => params[:password],
                     "city" => City.find_by(id: params[:city_id]))
    if @user.save # essaie de sauvegarder en base @user
      login(@user) # à la création de l'utilisateur, il faut login l'utilisateur.
      # si ça marche, il redirige vers la page d'index du site
      redirect_to gossips_path, status: :ok, notice: 'Ton gentil utilisateur a bien été créé en base !'
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render 'new'
    end
    puts "$" * 60
  end

  def edit
    # Méthode qui récupère l'utilisateur concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @user_hash = get_user_hash
  end

  def update
    # Méthode qui met à jour l'utilisateur à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher l'utilisateur modifié)
    puts "$" * 60
    puts "Salut, je suis dans le serveur pour une mise à jour"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ email : #{params["email"]}"
    puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ password : #{params["password"]}"
    ok = false
    @user = User.find(params[:id])
    @user_hash = { "user" => @user, "index" => params[:id] }
    puts "user_hash : #{@user_hash}"
    if !params[:email].nil? && !params[:password].nil?
      user_saved = @user.update("first_name" => params[:first_name], # essaie de sauvegarder en base @user
                                "last_name" => params[:last_name],
                                "description" => params[:description],
                                "email" => params[:email],
                                "age" => params[:age],
                                "password" => params[:password],
                                "city" => City.find_by(id: params[:city_id]))
      if user_saved
        # si ça a marché, il redirige vers la méthode index
        ok = true
        @user = User.find(params[:id])
        @user_hash = { "user" => @user, "index" => params[:id] }
        puts "user_hash : #{@user_hash}"
        redirect_to gossips_path, status: :ok, notice: 'Ton gentil utilisateur a bien été mis à jour en base : il est bien plus "sympa" désormais !'
      end
    end
    if !ok
      # sinon, il render la view edit (qui est celle sur laquelle on est déjà)
      render 'edit'
    end
    puts "$" * 60
  end

  def destroy
    # Méthode qui récupère l'utilisateur concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    puts "$" * 60
    puts "Salut, je suis dans le serveur pour une suppression"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "user_id : #{params[:id]}"
    @user_hash = get_user_hash
    if !@user_hash['user'].nil?
      @user_hash['user'].destroy
      redirect_to gossips_path, status: :ok, notice: 'Ton "méchant" utilisateur a bien été supprimé en base : plus personne ne saura qu\'il a un jour existé !'
    end
    puts "$" * 60
  end

  private

  def get_user_hash
    @user_hash = { "user" => nil, "index" => -1 }
    user_id = params[:id].to_i
    user = nil
    puts "$" * 60
    puts "user_id : #{user_id}"
    nb_total = User.last.id
    if user_id.between?(1, nb_total)
      user = User.find_by(id: user_id)
    end
    @user_hash = { "user" => user, "index" => user_id }
    puts "user_hash : #{@user_hash}"
    puts "$" * 60
    @user_hash 
  end
end
