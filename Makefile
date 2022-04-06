NAME			=	cub3D
SRCS			=	main.c\
					main_loop.c\
					color.c\
					deal_key.c\
					get_next_line.c\
					get_next_line_utils.c\
					sprite_sort.c\
					util_func.c
OBJS_DIR		=	./objs
OBJS			=	$(addprefix $(OBJS_DIR)/, $(SRCS:.c=.o))

CC				=	gcc -g
#CFLAGS			=	-Wall -Wextra -Werror
INCLUDE			=	-I./include -I/usr/include -I./mlx_linux
MINI			=	-Lmlx_linux -lmlx_Linux -L/usr/lib -Imlx_linux -lXext -lX11 -lm
LIBFT			=	-Llibft -lft
RM				=	rm -f

.PHONY			:	all clean fclean re

vpath %.c srcs
vpath %.h include

all				:	$(NAME)

$(NAME)			:	$(OBJS)
					make -C mlx_linux
					make -C libft
					$(CC) $(CFLAGS) $(OBJS) $(MINI) $(LIBFT) -o $@

$(OBJS_DIR)/%.o	:	%.c
					$(CC) $(CFLAGS) $(INCLUDE) -O3 -c $< -o $@

clean			:
					make clean -C libft
					$(RM) $(OBJS)

fclean			:
					make fclean -C libft
					$(RM) $(OBJS) $(NAME) 

re				:	fclean all
