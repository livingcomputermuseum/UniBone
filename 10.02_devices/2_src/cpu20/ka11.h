// Interface of 11/20 PCU emulator to UniBone
typedef struct KA11 KA11;
struct KA11
{
	word r[16];
	word b;		// B register before BUT JSRJMP
	word ba;
	word ir;
	Bus *bus;
	byte psw;
	int traps;
	int be;
	int state;

	struct {
		int (*bg)(void *dev);
		void *dev;
	} br[4];
	word trapvec;	// for unibone

	word sw;
};

void ka11_reset(KA11 *cpu);
void ka11_setintr(KA11 *cpu, unsigned vec);
void ka11_pwrdown(KA11 *cpu);
void ka11_pwrup(KA11 *cpu);
void ka11_condstep(KA11 *cpu);

