Return-Path: <SRS0=Wyqd=AS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CB4C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 07:21:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8986F2065D
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 07:21:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ClNPdspQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8986F2065D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l7uDfwLUfSPPG8KW34mXxyeEAHqHqBU+F1lziBzax9g=; b=ClNPdspQRvuQf8wb+vPGynZFb
	v92MXyEUKd5xEWLpWdpdfXuXbl88OJ7hRsw0J53+zoF3CAe4Lizy1p69vWgESaQZ8sHu+zvorjQxD
	T8RTSQMQ8wJTX5GbEzDjz+d0+xvcVUC58/fYvVbi+UTxEa/xZX/HTG74TuC5jTOmELVwR42Cs214m
	2xfdqepjjtKXFGCrqXBFXqpNxvpCidNktITdvbT55WmgghCkLI+pnQ4HbLR8xodvaeRHA+hgaSYjd
	oI/pniPKKfXGuoMH7AdfHdFuNUc3uWUijVRRdGkAOE7ysv8Ye13oD3XHc83PGitvYyUudblqDljWJ
	lBadCK0uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jshv6-0002tZ-0C; Tue, 07 Jul 2020 07:21:36 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jshv3-0002t8-9j
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jul 2020 07:21:34 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4B1DQ132Ytz1rvxy;
 Tue,  7 Jul 2020 09:21:29 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4B1DQ12bVSz1r56p;
 Tue,  7 Jul 2020 09:21:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id H4JCz6NCyfCk; Tue,  7 Jul 2020 09:21:27 +0200 (CEST)
X-Auth-Info: 0I9NcZfKkWQ4HGQyQZpBz0a9m7ltvSvHWH3k/edcKBk=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue,  7 Jul 2020 09:21:27 +0200 (CEST)
Date: Tue, 7 Jul 2020 09:21:20 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH 1/3] y2038: linux: Provide __futimes64 implementation
Message-ID: <20200707092120.071d5157@jawa>
In-Reply-To: <347a5a21-c308-4fae-5b80-34ee22fe8c78@synopsys.com>
References: <20200217131735.18180-1-lukma@denx.de>
 <20200217131735.18180-2-lukma@denx.de>
 <347a5a21-c308-4fae-5b80-34ee22fe8c78@synopsys.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_032133_573087_FE62A506 
X-CRM114-Status: GOOD (  36.81  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: multipart/mixed; boundary="===============8323058356700602475=="
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--===============8323058356700602475==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/sBwCDnm+p0OyByzfgvcjwAe"; protocol="application/pgp-signature"

--Sig_/sBwCDnm+p0OyByzfgvcjwAe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 6 Jul 2020 22:58:27 +0000
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> Hi Lukasz,
>=20
> On 2/17/20 5:17 AM, Lukasz Majewski wrote:
> > This patch provides new __futimes64 explicit 64 bit function for
> > setting file's 64 bit attributes for access and modification time
> > (by specifying file descriptor number).
> >=20
> > Internally, the __utimensat64_helper function is used. This patch
> > is necessary for having architectures with __WORDSIZE =3D=3D 32 Y2038
> > safe.
> >=20
> > Moreover, a 32 bit version - __futimes has been refactored to
> > internally use __futimes64.
> >=20
> > The __futimes is now supposed to be used on systems still
> > supporting 32 bit time (__TIMESIZE !=3D 64) - hence the necessary
> > conversion of struct timeval to 64 bit struct __timeval64.
> >=20
> > The check if struct timevals' usec fields are in the range between
> > 0 and 1000000 has been removed as Linux kernel performs it
> > internally in the implementation of utimensat (the conversion
> > between struct __timeval64 and __timespec64 is not relevant for
> > this particular check).
> >=20
> > Last but not least, checks for tvp{64} not being NULL have been
> > preserved from the original code as some legacy user space programs
> > may rely on it.
> >=20
> > Build tests:
> > ./src/scripts/build-many-glibcs.py glibcs
> >=20
> > Run-time tests:
> > - Run specific tests on ARM/x86 32bit systems (qemu):
> >   https://github.com/lmajewski/meta-y2038 and run tests:
> >   https://github.com/lmajewski/y2038-tests/commits/master
> >=20
> > Above tests were performed with Y2038 redirection applied as well
> > as without to test the proper usage of both __futimes64 and
> > __futimes. ---
> >  include/time.h                    |  3 +++
> >  sysdeps/unix/sysv/linux/futimes.c | 42
> > +++++++++++++++++-------------- =20
>=20
> ARC is 32-bit + TIMESIZE=3D=3D64 but the new code is not getting built
> (instead generic variant is). How do I override the generic fiel to
> be built instead ?

The futimes.c from sysdeps/unix/sysv/linux/ shall be built.=20

The futimes.c is defined in following locations:
y2038-glibc/misc
y2038-glibc/sysdeps/unix/sysv/linux
y2038-glibc/sysdeps/mach/hurd

The first one is a stub. The last one is for hurd.
ARC shall use the middle one as well.

When I'm in doubt (or when for example code is auto generated to wrap a
syscall) I do use
https://github.com/lmajewski/meta-y2038/blob/master/README

with gdb to check which function is called. Maybe it would help you too?

>=20
> >  2 files changed, 26 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/include/time.h b/include/time.h
> > index b81ecd5e6e..c24066bf3a 100644
> > --- a/include/time.h
> > +++ b/include/time.h
> > @@ -210,8 +210,11 @@ extern int __utimensat64_helper (int fd, const
> > char *file, libc_hidden_proto (__utimensat64_helper);
> > =20
> >  #if __TIMESIZE =3D=3D 64
> > +# define __futimes64 __futimes
> >  # define __futimens64 __futimens
> >  #else
> > +extern int __futimes64 (int fd, const struct __timeval64 tvp64[2]);
> > +libc_hidden_proto (__futimes64);
> >  extern int __futimens64 (int fd, const struct __timespec64 tsp[2]);
> >  libc_hidden_proto (__futimens64);
> >  #endif
> > diff --git a/sysdeps/unix/sysv/linux/futimes.c
> > b/sysdeps/unix/sysv/linux/futimes.c index 4bea864470..21b41e4138
> > 100644 --- a/sysdeps/unix/sysv/linux/futimes.c
> > +++ b/sysdeps/unix/sysv/linux/futimes.c
> > @@ -17,35 +17,39 @@
> >     <https://www.gnu.org/licenses/>.  */
> > =20
> >  #include <errno.h>
> > -#include <sysdep.h>
> > -#include <string.h>
> >  #include <time.h>
> > -#include <utime.h>
> > -#include <sys/time.h>
> > -#include <_itoa.h>
> > -#include <fcntl.h>
> > -
> > =20
> >  /* Change the access time of the file associated with FD to TVP[0]
> > and
> > -   the modification time of FILE to TVP[1].
> > +   the modification time of FILE to TVP[1].  */
> > +int
> > +__futimes64 (int fd, const struct __timeval64 tvp64[2])
> > +{
> > +  /* The utimensat system call expects timespec not timeval.  */
> > +  struct __timespec64 ts64[2];
> > +  if (tvp64 !=3D NULL)
> > +    {
> > +      ts64[0] =3D timeval64_to_timespec64 (tvp64[0]);
> > +      ts64[1] =3D timeval64_to_timespec64 (tvp64[1]);
> > +    }
> > +
> > +  return __utimensat64_helper (fd, NULL, tvp64 ? &ts64[0] : NULL,
> > 0); +}
> > +
> > +#if __TIMESIZE !=3D 64
> > +libc_hidden_def (__futimes64)
> > =20
> > -   Starting with 2.6.22 the Linux kernel has the utimensat syscall
> > which
> > -   can be used to implement futimes.  */
> >  int
> >  __futimes (int fd, const struct timeval tvp[2])
> >  {
> > -  /* The utimensat system call expects timespec not timeval.  */
> > -  struct timespec ts[2];
> > +  struct __timeval64 tv64[2];
> > +
> >    if (tvp !=3D NULL)
> >      {
> > -      if (tvp[0].tv_usec < 0 || tvp[0].tv_usec >=3D 1000000
> > -          || tvp[1].tv_usec < 0 || tvp[1].tv_usec >=3D 1000000)
> > -	return INLINE_SYSCALL_ERROR_RETURN_VALUE (EINVAL);
> > -
> > -      TIMEVAL_TO_TIMESPEC (&tvp[0], &ts[0]);
> > -      TIMEVAL_TO_TIMESPEC (&tvp[1], &ts[1]);
> > +      tv64[0] =3D valid_timeval_to_timeval64 (tvp[0]);
> > +      tv64[1] =3D valid_timeval_to_timeval64 (tvp[1]);
> >      }
> > =20
> > -  return INLINE_SYSCALL (utimensat, 4, fd, NULL, tvp ? &ts : NULL,
> > 0);
> > +  return __futimes64 (fd, tvp ? &tv64[0] : NULL);
> >  }
> > +#endif
> >  weak_alias (__futimes, futimes)
> >  =20
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/sBwCDnm+p0OyByzfgvcjwAe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl8EInAACgkQAR8vZIA0
zr0BCgf/cetEYjG1eciGuOY4V46JVa3+qcBgAdhLnwu7pdMBrJrJn7j1zgVANsZt
s73UCXRQAmiEmZZMYO3g0bQCW3STNlBpP4yKaWpzvRCxp6lG0n0hz+5Lt6qfBs3u
cHR4ekllAl9YkcirACfJYWAqV1ccrdnppTCEC6+5OnU/GUENCwnWn3EVGIqOHNLa
QkF0WlA97hDE6z9jYh1fGhbjWEQ072p40h6WvtRDopcYMytOcLnEA0/bVnj68Fn3
KFkJYMSf5k0VPDy7uhbSUzgneXo/vvgaMDLB9qB/dc3QHgqTm4dBPFgLbKuOQPml
9sEq/14JgPCML0kPi1NhlCGTRftCoQ==
=L+ho
-----END PGP SIGNATURE-----

--Sig_/sBwCDnm+p0OyByzfgvcjwAe--


--===============8323058356700602475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--===============8323058356700602475==--

