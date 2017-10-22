<?php
use app\models\Cities;
use app\models\Userstointerests;
use app\models\Avatars;
use yii\grid\GridView;

/* @var $this yii\web\View */

// $this->title = 'Matcha';
?>

<div class="row is-table-row" style="margin-bottom: 10px;">

    <?php if($isAbleToLike): ?>
        <div class="col-sm-2 user-id-like" >
            <a href="#" class="like like-toggle" id="<?php echo $model->Id ?>" class="text-center" <?php if(in_array($model->id, $likes)) { echo "style='display: none;'"; } ?> >
                <img src="<?php echo Yii::$app->request->baseUrl . '/sources/like.png' ?>" class="img img-responsive">
            </a>
            <a href="#" class="unlike like-toggle" id="<?php echo $model->Id ?>" class="text-center" <?php if(!in_array($model->id, $likes)) { echo "style='display: none;'"; } ?> >
                <img src="<?php echo Yii::$app->request->baseUrl .'/sources/liked.png' ?>" class="img img-responsive">
            </a>
        </div>
    <?php else: ?>
        <div class="col-sm-2 user-id-like" >
            <img src="<?php echo Yii::$app->request->baseUrl . '/sources/like.png' ?>" class="img img-responsive">
            <span>To be able to like, you must have a main avatar or be logged in</span>
        </div>
    <?php endif; ?>

    <div class="col-sm-4 bg-success text-center">
        <a href="../users/user/<?php echo $model->user_name ?>">
            <img src="<?php echo Yii::$app->request->baseUrl . '/' . Avatars::getAvatarsByUserId($model->id)->avatar1 ?>" class="img-circle img-responsive center-block">
            <br>
            Fame-rating: <code> <?php echo $model->fame_rating; ?> </code>
        </a>
    </div>
    
    <div class="col-sm-4 bg-info">
        <h3><?php echo $model->first_name. " " .$model->last_name; ?>
            <small> <?php echo $model->user_name ?> </small>
        </h3>
        <br>
        <hr>
        <p>
            <span class="text-muted">Email: </span>
            <span><?php echo $model->email ?></span>
        </p>
        <p>
            <span class="text-muted">Gender: </span>
            <span><?php echo $model->genderList[$model->gender] ?></span>
        </p>
        <p>
            <span class="text-muted">Orientation: </span>
            <span><?php echo $model->orientationList[$model->orientation] ?></span>
        </p>
        <p>
            <span class="text-muted">Interests: </span>
            <span><?php echo Userstointerests::getInterestsToStringByUserId($model->id) ?></span>
        </p>
        <p>
            <span class="text-muted">City: </span>
            <span><?php if(isset($model->city->city)) { echo $model->city->city; } ?></span>
        </p>
        <p>
            <span class="text-muted">About: </span>
            <span><?php echo $model->about ?></span>
        </p>
    </div>
    
</div>        
