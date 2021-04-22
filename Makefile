CC		= gcc
FLAGS	= -Wall -Wextra -Werror
HEADER	= ft_printf.h
NAME	= libftprintf.a
RM		= rm -f
FILES	= ft_printf.c \
			srcs/get_precision.c srcs/ft_itoa_address.c \
			srcs/ft_count.c srcs/ft_itoa_base.c \
			srcs/ft_utoa_base.c srcs/print_it.c \
			srcs/get_width.c srcs/has_flags.c srcs/str_lenn.c \
			srcs/manage_width.c srcs/convert_c.c \
			srcs/manage_numbers_output.c srcs/convert_d.c \
			srcs/convert_p.c srcs/convert_prc.c \
			srcs/convert_s.c srcs/convert_u.c \
			srcs/convert_x.c srcs/convert_xx.c \
			srcs/ft_putchr_fd.c srcs/get_width_star.c

OBJECTS	= $(FILES:.c=.o)

all: $(NAME)

$(NAME): mk $(OBJECTS) printf
	cp libft/libft.a $(NAME)
	ar -rc $(NAME) $(OBJECTS)

mk:
	@$(MAKE) -C ./libft

.c.o:
	@$(CC) $(FLAGS) -I $(HEADER) -c $< -o $(<:.c=.o)

printf:
	$(CC) $(FLAGS) -I $(HEADER) $(OBJECTS) libft/*.o main.c -o printf

clean:
	@$(MAKE) clean -C ./libft
	@$(RM) $(OBJECTS) printf

fclean: clean
	@$(MAKE) fclean -C ./libft
	@$(RM) $(NAME)

re: fclean all
