#include<stdio.h>

// Liste simplu inlantuite

typedef struct celula {
    int info;
    struct celula *urm;
}TCelula, *TLista;

void print(TLista L) {
    TLista aux;
    for (aux = L; aux != NULL; aux = aux->urm) {
        print;
    }
}

void afisarelista (TLista l) {
    while (l) {
        printf("%d", l->info);
        l = l->urm;
    }
}

TLista AlocCelula(int x) {
    TLista aux =(TLista)malloc(sizeof(TCelula));
    if(!aux) return NULL;

    aux->urm = NULL;
    aux->info = x;
    return aux;
}

int InsertDupaRef(TLista l,int x, int ref) {
    while (l) {
        if(l->info == ref) break;
        l=l->urm;
    }
    if(l->info == ref) {
    TLista aux = AlocCelula(x);
    if(!aux) return 0;
    aux->urm = l->urm;
    l->urm = aux;
    return 1;
    }
}

int InserrareInainteRef(TLista *l,int x, int ref) {
    TLista p = *l, ant = NULL;
    while (p) {
        if(p->info == ref) break;
        ant = p;
        p = p->urm;
    }
    if (!p) return 0;
    TLista aux = Aloc(x);
    if(!aux) return 0;
    
    if(ant == NULL) {
        aux->urm = *l;
        *l = aux;
    } else {
        aux->urm = p->urm;
        p->urm = aux;
    }
    return 1;
}

int InsLaInceput(int x, TLista *l) {
    TLista aux = aloc(x);
    if (!aux) return 0;
    aux->urm = *l;
    *l = aux;
    return 1;
}

int InsLaFinal(int x, TLista *l) {
    TLista aux = aloc(x);
    if (!aux) return 0;
    TLista p = *l, ant = NULL;
    while (p) {
        ant = p;
        p=p->urm;
    }
    if (ant == NULL) {
        *l = aux;
    } else {
        ant->urm = aux;
    }
    return 1;
}

int EliminareLista(TLista *l, int x) {
    TLista p = *l, ant = NULL;
    while (p) {
        if(p->info == x) break;
        ant = p;
        p = p->urm;
    }
    if (!ant) {
        *l = (*l)->urm;
        free(p);
        return 1;
    } else {
        ant->urm = p->urm;
        free(p);
        return 1;
    }
    return 0;
}

TLista CitireLista() {
    TLista L = NULL, aux, ultim = NULL;
    int x;
    while (scanf("%d", &x) == 1) {
        aux = aloc(x);
        if(!aux) return L;
        if(ultim == NULL) L = aux;
        else {
            ultim->urm = aux;
        }
        ultim = aux;
    }
    return L;
}

void DistL(TLista *l) {
    TLista p = *l, ant = NULL;
    while(p) {
        ant = p;       
        p = p->urm;
        free(ant);
    }
    *l = NULL;
}

TLista copieL(TLista l) {
    TLista copie = NULL, ultim = NULL, aux, ant = NULL;
    while (l) {
        ant = l;
        l = l->urm;
        aux = aloc(ant->info);
        if (!aux) return copie;
        if (ultim == NULL) copie = aux;
        else ultim->urm = aux;
        ultim = aux;
    }
    return copie;
}

int MutaElemPare(TLista *l, TLista *r, int x) {
    TLista p = *l, ant = NULL, ultim = NULL;
    while (p) {
        if (p->info != NULL) {
            ant = p;
            p = p->urm;
        } else {
            if(!ant) *l = p->urm;
            else ant = p->urm;
            if (!ultim) *r = p;
            else ultim->urm = p;
            ultim = p;
            p = p->urm;
            ultim->urm = NULL;
        }
    }
}

void InversareLista(TLista *l) {
    TLista p = (*l)->urm, ant = NULL;
    while (p) {
        ant = p;
        p=p->urm;
        ant->urm = (*l);;
        (*l) = ant;
    }
}





// Liste dublu inlantuite





typedef struct celula2 {
    int info;
    struct celula2 *pre, *urm;
}TCelula2, *TL2;

TL2 InitL2() {
    TL2 s = (TL2)malloc(sizeof(TCelula2));
    if(!s) return NULL;
    s->info = 0;
    s->pre = s;
    s->urm = s;
    return s;
}



//stiva

int PushS(TLista *vf, int x) {
    TLista aux = (TLista)malloc(sizeof(TCelula));
    if(!aux) return 0;
    aux->info = x;
    aux->urm = *vf;
    *vf = aux;
    return 1;
}

int PopS(TLista *vf, int *ax) {
    if(!(*vf)) return 0;
    *ax = (*vf)->info;
    TLista aux = *vf;
    *vf = aux->urm;
    free(aux);
    return 1;
}

void DistrugeS(TLista *vf) {
    TLista p = *vf, ant = NULL;
    while(p) {
        ant = p;
        p = p->urm;
        free(ant);
    }
    *vf = NULL;
}

// coada

typedef struct coada {
    TLista inc, sf;
}TCoada;

TCoada* InitCoada() {
    TCoada *c = (TCoada *)malloc(sizeof(TCoada));
    c->inc = NULL;
    c->sf = NULL;
    return c;
}

int PushQ(TCoada *c,  int x) {
    TLista aux = (TLista)malloc(sizeof(TCelula));
    aux->info = x;
    aux->urm = NULL;
    if (!aux) return 0;
    if(!(c->inc)) {
        c->inc = aux;
        c->sf = aux;
    } else {
        c->sf->urm = aux;
        c->sf = aux;
    }
    return 1;
}

int PopQ(TCoada *c, int *x) {
    if (!(c->inc)) return 0;
    *x = c->inc->info;
    TLista aux = c->inc;
    c->inc = aux->urm;
    free(aux);
    if (c->inc == NULL) {
        c->sf = NULL;
    }
    return 1;
}

void RestetQ(TCoada *c) {
    TLista p = c->inc;
    c->inc = NULL;
    c->sf = NULL;
    TLista aux = NULL;
    while (p) {
        aux = p;
        p = p->urm;
        free(ant);
    }
}

void ConcatQ(TCoada *q, TCoada *s) {
    if(s->inc == NULL) return;
    if(q->inc == NULL) {
        q->inc = s->inc;
        q->sf = s->sf;
    } else {
        q->sf->urm = s->inc;
        q->sf = s->sf;
    }
    s->inc = NULL;
    s->sf = NULL;
}



//arbori

typedef struct nod {
    int info;
    struct nod *st, *dr;
}TNod, *TArb;



int NumaraNoduriParSRD(TArb a) {
    if (!a) return 0;
    int n;
    n = NumaraNoduriParSRD(a->st);
    if (a->info % 2 == 0) n++;
    n += NumaraNoduriParSRD(a->dr);

    return n;
}

int NumaraNiveluri(TArb a) {
    if (!a) return 0;
    int ns, nd;

    ns = NumaraNiveluri(a->st);
    nd = NumaraNiveluri(a->dr);

    return 1 + max(ns, nd);
}

int Cauta(TArb a, int x) {
    if (!a) return 0;
    if (a->info == x) return 1;
    int r;

    r = Cauta(a->st, x);
    if (r == 1) return 1;
    r = Cauta(a->dr, x);

    return r;
}

int aux(TArb a, int x, int nivcrt) {
    if (!a) return -1;
    int r;
    r = aux(a->st, x, nivcrt + 1);
    if (r >= 0 ) return r;
    return aux(a->dr, x, nivcrt + 1);
}

int Cauta2(TArb a, int x) {
    if (a == NULL) return -1;
    if (a->info == x) return 0;
    int r;
    r = Cauta2(a->st, x);
    if (r < 0) {
        r = Cauta2(a->dr, x);
        if (r < 0) return -1;
    }
    return r + 1;
}