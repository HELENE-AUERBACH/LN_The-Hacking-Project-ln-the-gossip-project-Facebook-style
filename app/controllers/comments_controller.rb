class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    # Méthode qui récupère tous les commentaires et les envoie à la view index (index.html.erb) pour affichage
    @comments = Comment.all
    puts "$" * 60
    puts "Voici le nombre de commentaires dans la base : #{@comments.length}"
    puts "$" * 60
  end

  def show
    # Méthode qui récupère le commentaire concerné et l'envoie à la view show (show.html.erb) pour affichage
    @comment_hash = get_comment_hash 
  end

  def new
    # Méthode qui crée un commentaire vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @new_comment = Comment.new
  end

  def create
    # Méthode qui créé un commentaire à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le commentaire créé)
    puts "$" * 60
    puts "Salut, je suis dans le serveur pour une création"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ content : #{params["content"]}"
    @comment = Comment.new("content" => params[:content],
                           "gossip" => Gossip.find(params[:gossip_id]),
                           "author" => current_user)
    if @comment.save # essaie de sauvegarder en base @comment
      # si ça marche, il redirige vers la page d'index du site
      redirect_to gossip_path(params["gossip_id"]), status: :ok, notice: 'Ton super commentaire a bien été créé en base pour la postérité !'
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render 'new'
    end
    puts "$" * 60
  end

  def edit
    # Méthode qui récupère le commentaire concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @comment_hash = get_comment_hash 
  end

  def update
    # Méthode qui met à jour le commentaire à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le commentaire modifié)
    puts "$" * 60
    puts "Salut, je suis dans le serveur pour une mise à jour"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ content : #{params["content"]}"
    ok = false
    @comment = Comment.find(params[:id])
    @comment_hash = { "comment" => @comment, "index" => params[:id] }
    puts "comment_hash : #{@comment_hash}"
    if !params[:content].nil?
      comment_saved = @comment.update("content" => params[:content], # essaie de sauvegarder en base @comment
                                      "gossip" => Gossip.find(params[:gossip_id]),
                                      "author" => current_user)
      if comment_saved
        # si ça a marché, il redirige vers la méthode index
        ok = true
        @comment = Comment.find(params[:id])
        @comment_hash = { "comment" => @comment, "index" => params[:id] }
        puts "comment_hash : #{@comment_hash}"
        redirect_to gossip_path(params["gossip_id"]), status: :ok, notice: 'Ton super commentaire a bien été mis à jour en base : il est bien plus "acide" désormais !'
      end
    end
    if !ok
      # sinon, il render la view edit (qui est celle sur laquelle on est déjà)
      render 'edit'
    end
    puts "$" * 60
  end

  def destroy
    # Méthode qui récupère le commentaire concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    puts "$" * 60
    puts "Salut, je suis dans le serveur pour une suppression"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "comment_id : #{params[:id]}"
    @comment_hash = get_comment_hash 
    if !@comment_hash['comment'].nil?
      @comment_hash['comment'].destroy
      redirect_to gossip_path(params["gossip_id"]), status: :ok, notice: 'Ton "sale petit" commentaire a bien été supprimé en base : plus personne ne saura que tu as un jour osé l\'écrire !'
    end
    puts "$" * 60
  end

  private

  def get_comment_hash
    @comment_hash = { "comment" => nil, "index" => -1 }
    comment_id = params[:id].to_i
    comment = nil
    puts "$" * 60
    puts "comment_id : #{comment_id}"
    nb_total = Comment.last.id
    if comment_id.between?(1, nb_total)
      comment = Comment.find_by(id: comment_id)
    end
    @comment_hash = { "comment" => comment, "index" => comment_id }
    puts "comment_hash : #{@comment_hash}"
    puts "$" * 60
    @comment_hash
  end
end
