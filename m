From: Anton.Kolesov@synopsys.com (Anton Kolesov)
Date: Fri, 11 Mar 2016 12:13:57 +0000
Subject: big endian builds
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E8F662@us01wembx1.internal.synopsys.com>
References: <C2D7FE5348E1B147BCA15975FBA23075F4E8F650@us01wembx1.internal.synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8F662@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B13580BBABA@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Nightly verification script modifies CONFIG_CROSS_COMPILE in the .config file before build Linux - little or big endian doesn't matter, so path to tools is always correct. It sets full path in .config, instead of prepending PATH. CONFIG_CPU_BIG_ENDIAN is set accordingly.

--------8<--------

# Generate proper .config file from defconfig
make $MAKEFLAGS -C $src_dir/linux O=$odir ARCH=arc olddefconfig

# Set toolchain path
sed -i \
    -e "s|CONFIG_CROSS_COMPILE=\".*\"|CONFIG_CROSS_COMPILE=\"$build_dir/$target_toolchain/bin/$target_prefix\"|" \
    $odir/.config

# Set proper endianness. It's necessary to set it explicitly because
# we are not sure what value for CONFIG_CPU_BIG_ENDIAN flag is set
# because of impact of allnoconfig or allyesconfig configurations.
if [ $target_endian = eb ]; then
    kconfig_enable_option $odir CONFIG_CPU_BIG_ENDIAN
else
    kconfig_disable_option $odir CONFIG_CPU_BIG_ENDIAN
fi


# Regenerate .config with new CONFIG_CPU_BIG_ENDIAN option value. It's
# necessary because this option may be not presented in platforms defconfigs
# thus sed cannot fix it before generating the first version of .config.
make $MAKEFLAGS -C $src_dir/linux O=$odir ARCH=arc olddefconfig

--------8<--------

Anton

> -----Original Message-----
> From: Vineet Gupta [mailto:vgupta at synopsys.com]
> Sent: Friday, March 11, 2016 9:53 AM
> To: Vineet Gupta <Vineet.Gupta1 at synopsys.com>; Anton Kolesov <Anton.Kolesov at synopsys.com>; Alexey
> Brodkin <Alexey.Brodkin at synopsys.com>; Noam Camus <noamc at ezchip.com>
> Cc: arcml <linux-snps-arc at lists.infradead.org>
> Subject: Re: big endian builds
> 
> On Friday 11 March 2016 12:18 PM, Vineet Gupta wrote:
> > So for big endian kernel builds, just selecting the CONFIG_CPU_BIG_ENDIAN is not
> > sufficient, we also need to manually change the CROSS_COMPILE prefix to arceb-xxx.
> >
> > @Anton, is that what you do for verification builds !
> >
> > @Noam I presume your defconfig has CONFIG_CROSS_COMPILE or you have set in env
> > variable ?
> >
> >
> > The kernel build system needs to take take care of that. Do you guys have issues
> > with patch below
> >
> > ------------>
> > diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> > index c8230f3395f2..4abcdb89e391 100644
> > --- a/arch/arc/Makefile
> > +++ b/arch/arc/Makefile
> > @@ -9,8 +9,12 @@
> >  UTS_MACHINE := arc
> >
> >  ifeq ($(CROSS_COMPILE),)
> > +ifndef CONFIG_CPU_BIG_ENDIAN
> > +CROSS_COMPILE := arceb-linux-
> > +else
> 
> Please pardon this nonsense as lack of caffeine - despite the obvious fixup, I
> still need to change the .config.
> I think we need to revert the defconfig patch for fixing the CROSS_COMPILE prefix
> after all !
> 
> >  CROSS_COMPILE := arc-linux-
> >  endif
> > +endif
> >
> >
> > _______________________________________________
> > linux-snps-arc mailing list
> > linux-snps-arc at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-snps-arc
> >
