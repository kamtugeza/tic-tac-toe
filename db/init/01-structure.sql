CREATE TABLE "player" (
    "id" uuid NOT NULL,
    "name" varchar(60) NOT NULL
);

ALTER TABLE "player" ADD CONSTRAINT "pk_player" PRIMARY KEY ("id");


CREATE TABLE "game" (
    "created_by" uuid NOT NULL,
    "created_on" timestamp NOT NULL,
    "id" uuid NOT NULL,
    "finished_on" timestamp NULL,
    "winner_id" uuid NULL
);

ALTER TABLE "game" ADD CONSTRAINT "pk_game" PRIMARY KEY ("id");
ALTER TABLE "game" ADD CONSTRAINT "fk_game_created_by" FOREIGN KEY ("created_by") REFERENCES "player" ("id");
ALTER TABLE "game" ADD CONSTRAINT "fk_game_winner_id" FOREIGN KEY ("winner_id") REFERENCES "player" ("id");

CREATE TABLE "participant" (
    "game_id" uuid NOT NULL,
    "id" serial NOT NULL,
    "player_id" uuid NOT NULL,
    "role" int2 NOT NULL,
    "symbol" int2 NULL 
);

ALTER TABLE "participant" ADD CONSTRAINT "pk_participant" PRIMARY KEY ("id");
ALTER TABLE "participant" ADD CONSTRAINT "fk_participant_game_id" FOREIGN KEY ("game_id") REFERENCES "game" ("id");
ALTER TABLE "participant" ADD CONSTRAINT "fk_participant_player_id" FOREIGN KEY ("player_id") REFERENCES "player" ("id");


CREATE TABLE "move" (
    "cell" int2 NOT NULL,
    "game_id" uuid NOT NULL,
    "id" serial,
    "moved_on" timestamp NOT NULL,
    "player_id" uuid NOT NULL
);

ALTER TABLE "move" ADD CONSTRAINT "pk_move" PRIMARY KEY ("id");
ALTER TABLE "move" ADD CONSTRAINT "fk_move_game_id" FOREIGN KEY ("game_id") REFERENCES "game" ("id");
ALTER TABLE "move" ADD CONSTRAINT "fk_move_player_id" FOREIGN KEY ("player_id") REFERENCES "player" ("id");