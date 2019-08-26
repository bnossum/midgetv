void cywait(uint32_t lim) {
        volatile uint32_t i;

        for ( i = 0; i < lim; i++ )
                ;
}

int main( void ) {
        while (1) {
                LED->D = ++i;
                cywait(0x4000);
        }
}
