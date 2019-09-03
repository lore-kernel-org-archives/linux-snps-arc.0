From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Wed, 4 Sep 2019 00:08:49 +0900
Subject: [PATCH 2/3] kbuild, arc: add CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
 for ARC
In-Reply-To: <ed251c63-10e0-bd8a-1a9b-be9ade5cad3f@gmail.com>
References: <20190820170941.26193-1-yamada.masahiro@socionext.com>
 <20190820170941.26193-2-yamada.masahiro@socionext.com>
 <ed251c63-10e0-bd8a-1a9b-be9ade5cad3f@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAK7LNARd1KFq=GRYQUr16KaiiRzh4ARX5eOpcRcUrZSVgHdhJA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Sat, Aug 31, 2019@1:43 AM Vineet Gupta <vineetg76@gmail.com> wrote:
>
> On 8/20/19 10:09 AM, Masahiro Yamada wrote:
> > arch/arc/Makefile overrides -O2 with -O3. This is the only user of
> > ARCH_CFLAGS. There is no user of ARCH_CPPFLAGS or ARCH_AFLAGS.
> > My plan is to remove ARCH_{CPP,A,C}FLAGS after refactoring the ARC
> > Makefile.
>
> Why, it seems like a good generic facility for arches to over-ride stuff
> (specially adding any toggles at the end of cmdline).
>
> And even if there are no current users, it would be good to have. I understand we
> don't keep code for future, but strictly this is meta-code ;-)

We can re-add it whenever we need it.



> > Currently, ARC has no way to enable -Wmaybe-uninitialized because both
> > -O3 and -Os disable it. Enabling it will be useful for compile-testing.
> > This commit allows allmodconfig (, which defaults to -O2) to enable it.
>
> But this is a separate issue and was done on purpose because of unbearable build
> spew at the time. As an experiment I enabled it in current kernel and at -O3 we
> still get the dreaded spew in net/sunrpc/xdr.c and some more in net/ipv4. The spew
> doesn't happen at -O2 and seems not ARC specific as I can see this with ARM -O3
> build with gcc 7.3 (buildroot 2018.08)
>
> | $ make ARCH=arm CROSS_COMPILE=arm-linux- net
> | ......
> | ......
> | ../net/sunrpc/xdr.c: In function ?xdr_encode_word?:
> | ../net/sunrpc/xdr.c:1199:2: warning: ?subbuf.tail[0].iov_base? may be used
> | uninitialized in this function [-Wmaybe-uninitialized]
> |  memcpy(subbuf->tail[0].iov_base, obj, this_len);
> |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | ../net/sunrpc/xdr.c:1205:17: note: ?subbuf.tail[0].iov_base? was declared here
> |  struct xdr_buf subbuf;
>
>
> I understand the value of this toggle, but the spew is too much and at times
> obfuscated likely other real issues.
> > Add CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3=y to all the defconfig files
> > in arch/arc/configs/ in order to keep the current config settings.
>
> My first reaction to adding this to all defconfigs was that this was inelegant :
> for lack of better word :-)
>
> But indeed it seems better this way as we can now experiment with -O2 vs. -O3 from
> config, rather than hardwiring to -O3.
>
> So if you could please split out the Wmaybe-uninitialized change

I could not understand your request.

I added 'imply CC_DISABLE_WARN_MAYBE_UNINITIALIZED'
for CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3.

I cannot split it out. Otherwise, you will see false-positive
maybe-uninitialized warnings.


> Acked-by: Vineet Gupta <vgupta at synopsys.com>

Thanks.


-- 
Best Regards
Masahiro Yamada
