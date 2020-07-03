Return-Path: <SRS0=Y0WM=AO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE48C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Jul 2020 17:10:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C3BA20870
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Jul 2020 17:10:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IFtzDvPJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kvz71icJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C3BA20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BiRWogAS7ZC61e+kQK74hj0FDDph9eSl7YCZWOqhEh8=; b=IFtzDvPJ412gpku2KZqdDfPGT
	FOQr1jl2+Vr6aw18dqAKv6mLtdoZ1nYFzX+sfpIRPloKeIGwWl/jz8UnvECgHuo9nWZGiQMtFc4vo
	xp7nvA9sAiiI5jLDsFrtUlCvlesUi5zcbQZOWANS7eOXTufG/JlQyk5Kp1TZj9uOcswtdoIzcXK7M
	cbnW9TaUApxG+9NktzVWSLaTR5kmS87MzUD7RywHBMPl5aZB/vJDWYz2mJUauUmW+KDd/lo0urA7P
	vmEBRfrsq33loew1TRKyapZyOdwKB6b+780u/LUW/KA3IwE9s63Mk4drDsvz/sOo0jSuIvanr0ueh
	qeHwAQ8lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrPCN-0004cZ-LM; Fri, 03 Jul 2020 17:10:03 +0000
Received: from mail-qk1-f195.google.com ([209.85.222.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrPC9-0004WW-8i
 for linux-snps-arc@lists.infradead.org; Fri, 03 Jul 2020 17:10:00 +0000
Received: by mail-qk1-f195.google.com with SMTP id e13so29360331qkg.5
 for <linux-snps-arc@lists.infradead.org>; Fri, 03 Jul 2020 10:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HTAAHAtnzsDKOtcfEqcpcv+Dr9zBnpARtZJrukUXFvM=;
 b=kvz71icJYUKgBC0Q1krvIMOxcf2DBrJ8RbmpeXfIvrEP8/geNnZKW+t48Y0cbmN/Iz
 0xaufqbu2dKrAF7KLReBkTSNUbF6MCdsD4NGosWx1l9sod7dpyxx7hbtT7/aZfGgbLTl
 R0lvfeYghN7YoZy5mywFAQ+UWbcvxSRizcgxNp2OBFhF1th9ph0Me0pPJYlPDDd8Kr08
 Ie4goqAgzlfD1evNipZe2D5UGakVIyOLLfTALW/06Duq+uRCKm/7FoTCN33nMKsWyoj6
 qmfhMDAz0tK7GAOPwHJOmt83twjFx9/po/RUs6suw0bk4t7j6qM7p8CE0AR5xlfTlPJI
 fvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=HTAAHAtnzsDKOtcfEqcpcv+Dr9zBnpARtZJrukUXFvM=;
 b=FceGFZlKpn3c4VqAQb64CekqKhzEsks8gFZAwLkiOs3Rxj7cQS0kZ5PVVcTpEpZz7x
 VzC1UYBO3ghA3VjalAXOqRvJiLWq7JZczqCFb2y4/yrCCuayt3bsR6jj+5elit3h5gk/
 ZNeiifr28UNJL0OJ4gMpqpY2xE+NfkdAiO8OIoCVE7OUMg6vU26B87LXC4/hdBIKXuzb
 wK2QPTeGptxv+JETjWajstFbtA3atZn31i19oVGjYSZVeu/o33grEY33TAAO/x8+1yJ9
 /YX7yLdF0s+OPbkizN4lSetKoKFw6N0EreZiW371/IRcUm6OPmbNoEEoqysPX8EDvLP9
 DmYA==
X-Gm-Message-State: AOAM531OhSdrtN4CcXCBrqUhZ4VBEe95ibyTKNxKC8nxCLeA9XoWWmnE
 rgXzoZjULSY0ZFBAfSXSUfOsEenmvNQ=
X-Google-Smtp-Source: ABdhPJzJEsWLtVbPoj/g2fnVE7H1yezGEsHN6LNAyumKILkUMKItfKm4oyFy++aEzky5xKGYNKyITA==
X-Received: by 2002:a37:d0d:: with SMTP id 13mr37608637qkn.234.1593796185602; 
 Fri, 03 Jul 2020 10:09:45 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id g16sm14121317qko.5.2020.07.03.10.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2020 10:09:45 -0700 (PDT)
Subject: Re: [PATCH v7 11/13] ARC: Build Infrastructure
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>, libc-alpha@sourceware.org
References: <20200615201441.31820-1-vgupta@synopsys.com>
 <20200615201441.31820-12-vgupta@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <bf14b940-d950-68e3-b348-a1ad786b31e5@linaro.org>
Date: Fri, 3 Jul 2020 14:09:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200615201441.31820-12-vgupta@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_130949_455656_696967BD 
X-CRM114-Status: GOOD (  28.22  )
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
Cc: linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 15/06/2020 17:14, Vineet Gupta via Libc-alpha wrote:
> ---
>  config.h.in                                |   3 +
>  sysdeps/arc/Implies                        |   3 +
>  sysdeps/arc/Makefile                       |  21 +++
>  sysdeps/arc/Versions                       |   8 +
>  sysdeps/arc/configure                      | 182 +++++++++++++++++++++
>  sysdeps/arc/configure.ac                   |  26 +++
>  sysdeps/arc/nptl/Makefile                  |  22 +++
>  sysdeps/arc/preconfigure                   |  14 ++
>  sysdeps/unix/sysv/linux/arc/Implies        |   3 +
>  sysdeps/unix/sysv/linux/arc/Makefile       |  29 ++++
>  sysdeps/unix/sysv/linux/arc/Versions       |  16 ++
>  sysdeps/unix/sysv/linux/arc/configure      |   4 +
>  sysdeps/unix/sysv/linux/arc/configure.ac   |   4 +
>  sysdeps/unix/sysv/linux/arc/ldconfig.h     |  27 +++
>  sysdeps/unix/sysv/linux/arc/shlib-versions |   7 +

LGTM, thanks.

Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>


>  15 files changed, 369 insertions(+)
>  create mode 100644 sysdeps/arc/Implies
>  create mode 100644 sysdeps/arc/Makefile
>  create mode 100644 sysdeps/arc/Versions
>  create mode 100644 sysdeps/arc/configure
>  create mode 100644 sysdeps/arc/configure.ac
>  create mode 100644 sysdeps/arc/nptl/Makefile
>  create mode 100644 sysdeps/arc/preconfigure
>  create mode 100644 sysdeps/unix/sysv/linux/arc/Implies
>  create mode 100644 sysdeps/unix/sysv/linux/arc/Makefile
>  create mode 100644 sysdeps/unix/sysv/linux/arc/Versions
>  create mode 100644 sysdeps/unix/sysv/linux/arc/configure
>  create mode 100644 sysdeps/unix/sysv/linux/arc/configure.ac
>  create mode 100644 sysdeps/unix/sysv/linux/arc/ldconfig.h
>  create mode 100644 sysdeps/unix/sysv/linux/arc/shlib-versions
> 
> diff --git a/config.h.in b/config.h.in
> index 831eca2fe14e..2ed684b7d4e4 100644
> --- a/config.h.in
> +++ b/config.h.in
> @@ -109,6 +109,9 @@
>  /* AArch64 big endian ABI */
>  #undef HAVE_AARCH64_BE
>  
> +/* ARC big endian ABI */
> +#undef HAVE_ARC_BE
> +
>  /* C-SKY ABI version.  */
>  #undef CSKYABI
>  

Ok.

> diff --git a/sysdeps/arc/Implies b/sysdeps/arc/Implies
> new file mode 100644
> index 000000000000..780c4e246769
> --- /dev/null
> +++ b/sysdeps/arc/Implies
> @@ -0,0 +1,3 @@
> +wordsize-32
> +ieee754/flt-32
> +ieee754/dbl-64

Ok.

> diff --git a/sysdeps/arc/Makefile b/sysdeps/arc/Makefile
> new file mode 100644
> index 000000000000..d5a702e29e58
> --- /dev/null
> +++ b/sysdeps/arc/Makefile
> @@ -0,0 +1,21 @@
> +# ARC Makefile
> +# Copyright (C) 2020 Free Software Foundation, Inc.
> +# This file is part of the GNU C Library.
> +
> +# The GNU C Library is free software; you can redistribute it and/or
> +# modify it under the terms of the GNU Lesser General Public
> +# License as published by the Free Software Foundation; either
> +# version 2.1 of the License, or (at your option) any later version.
> +
> +# The GNU C Library is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +# Lesser General Public License for more details.
> +
> +# You should have received a copy of the GNU Lesser General Public
> +# License along with the GNU C Library.  If not, see
> +# <https://www.gnu.org/licenses/>.
> +
> +# We don't support long doubles as a distinct type.  We don't need to set
> +# this variable; it's here mostly for documentational purposes.
> +long-double-fcts = no

Ok.

> diff --git a/sysdeps/arc/Versions b/sysdeps/arc/Versions
> new file mode 100644
> index 000000000000..6ac7b8e49505
> --- /dev/null
> +++ b/sysdeps/arc/Versions
> @@ -0,0 +1,8 @@
> +libc {
> +  GLIBC_2.32 {
> +    __mcount;
> +  }
> +  GLIBC_PRIVATE {
> +    __syscall_error;
> +  }
> +}

Ok.

> diff --git a/sysdeps/arc/configure b/sysdeps/arc/configure
> new file mode 100644
> index 000000000000..bce7d3c3773d
> --- /dev/null
> +++ b/sysdeps/arc/configure
> @@ -0,0 +1,182 @@
> +# This file is generated from configure.ac by Autoconf.  DO NOT EDIT!
> + # Local configure fragment for sysdeps/arc.
> +
> +$as_echo "#define PI_STATIC_AND_HIDDEN 1" >>confdefs.h
> +
> +libc_cv_have_sdata_section=no
> +
> +# For ARC, historically ; was used for comments and not newline
> +# Later # also got added to comment list, but ; couldn't be switched to
> +# canonical newline as there's lots of code out there which will break
> +libc_cv_asm_line_sep='`'
> +cat >>confdefs.h <<_ACEOF
> +#define ASM_LINE_SEP $libc_cv_asm_line_sep
> +_ACEOF
> +
> +
> +# For big endian ABI, generate a symbol for selecting right dynamic linker
> +
> +
> +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for grep that handles long lines and -e" >&5
> +$as_echo_n "checking for grep that handles long lines and -e... " >&6; }
> +if ${ac_cv_path_GREP+:} false; then :
> +  $as_echo_n "(cached) " >&6
> +else
> +  if test -z "$GREP"; then
> +  ac_path_GREP_found=false
> +  # Loop through the user's path and test for each of PROGNAME-LIST
> +  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> +for as_dir in $PATH$PATH_SEPARATOR/usr/xpg4/bin
> +do
> +  IFS=$as_save_IFS
> +  test -z "$as_dir" && as_dir=.
> +    for ac_prog in grep ggrep; do
> +    for ac_exec_ext in '' $ac_executable_extensions; do
> +      ac_path_GREP="$as_dir/$ac_prog$ac_exec_ext"
> +      as_fn_executable_p "$ac_path_GREP" || continue
> +# Check for GNU ac_path_GREP and select it if it is found.
> +  # Check for GNU $ac_path_GREP
> +case `"$ac_path_GREP" --version 2>&1` in
> +*GNU*)
> +  ac_cv_path_GREP="$ac_path_GREP" ac_path_GREP_found=:;;
> +*)
> +  ac_count=0
> +  $as_echo_n 0123456789 >"conftest.in"
> +  while :
> +  do
> +    cat "conftest.in" "conftest.in" >"conftest.tmp"
> +    mv "conftest.tmp" "conftest.in"
> +    cp "conftest.in" "conftest.nl"
> +    $as_echo 'GREP' >> "conftest.nl"
> +    "$ac_path_GREP" -e 'GREP$' -e '-(cannot match)-' < "conftest.nl" >"conftest.out" 2>/dev/null || break
> +    diff "conftest.out" "conftest.nl" >/dev/null 2>&1 || break
> +    as_fn_arith $ac_count + 1 && ac_count=$as_val
> +    if test $ac_count -gt ${ac_path_GREP_max-0}; then
> +      # Best one so far, save it but keep looking for a better one
> +      ac_cv_path_GREP="$ac_path_GREP"
> +      ac_path_GREP_max=$ac_count
> +    fi
> +    # 10*(2^10) chars as input seems more than enough
> +    test $ac_count -gt 10 && break
> +  done
> +  rm -f conftest.in conftest.tmp conftest.nl conftest.out;;
> +esac
> +
> +      $ac_path_GREP_found && break 3
> +    done
> +  done
> +  done
> +IFS=$as_save_IFS
> +  if test -z "$ac_cv_path_GREP"; then
> +    as_fn_error $? "no acceptable grep could be found in $PATH$PATH_SEPARATOR/usr/xpg4/bin" "$LINENO" 5
> +  fi
> +else
> +  ac_cv_path_GREP=$GREP
> +fi
> +
> +fi
> +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_path_GREP" >&5
> +$as_echo "$ac_cv_path_GREP" >&6; }
> + GREP="$ac_cv_path_GREP"
> +
> +
> +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for egrep" >&5
> +$as_echo_n "checking for egrep... " >&6; }
> +if ${ac_cv_path_EGREP+:} false; then :
> +  $as_echo_n "(cached) " >&6
> +else
> +  if echo a | $GREP -E '(a|b)' >/dev/null 2>&1
> +   then ac_cv_path_EGREP="$GREP -E"
> +   else
> +     if test -z "$EGREP"; then
> +  ac_path_EGREP_found=false
> +  # Loop through the user's path and test for each of PROGNAME-LIST
> +  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> +for as_dir in $PATH$PATH_SEPARATOR/usr/xpg4/bin
> +do
> +  IFS=$as_save_IFS
> +  test -z "$as_dir" && as_dir=.
> +    for ac_prog in egrep; do
> +    for ac_exec_ext in '' $ac_executable_extensions; do
> +      ac_path_EGREP="$as_dir/$ac_prog$ac_exec_ext"
> +      as_fn_executable_p "$ac_path_EGREP" || continue
> +# Check for GNU ac_path_EGREP and select it if it is found.
> +  # Check for GNU $ac_path_EGREP
> +case `"$ac_path_EGREP" --version 2>&1` in
> +*GNU*)
> +  ac_cv_path_EGREP="$ac_path_EGREP" ac_path_EGREP_found=:;;
> +*)
> +  ac_count=0
> +  $as_echo_n 0123456789 >"conftest.in"
> +  while :
> +  do
> +    cat "conftest.in" "conftest.in" >"conftest.tmp"
> +    mv "conftest.tmp" "conftest.in"
> +    cp "conftest.in" "conftest.nl"
> +    $as_echo 'EGREP' >> "conftest.nl"
> +    "$ac_path_EGREP" 'EGREP$' < "conftest.nl" >"conftest.out" 2>/dev/null || break
> +    diff "conftest.out" "conftest.nl" >/dev/null 2>&1 || break
> +    as_fn_arith $ac_count + 1 && ac_count=$as_val
> +    if test $ac_count -gt ${ac_path_EGREP_max-0}; then
> +      # Best one so far, save it but keep looking for a better one
> +      ac_cv_path_EGREP="$ac_path_EGREP"
> +      ac_path_EGREP_max=$ac_count
> +    fi
> +    # 10*(2^10) chars as input seems more than enough
> +    test $ac_count -gt 10 && break
> +  done
> +  rm -f conftest.in conftest.tmp conftest.nl conftest.out;;
> +esac
> +
> +      $ac_path_EGREP_found && break 3
> +    done
> +  done
> +  done
> +IFS=$as_save_IFS
> +  if test -z "$ac_cv_path_EGREP"; then
> +    as_fn_error $? "no acceptable egrep could be found in $PATH$PATH_SEPARATOR/usr/xpg4/bin" "$LINENO" 5
> +  fi
> +else
> +  ac_cv_path_EGREP=$EGREP
> +fi
> +
> +   fi
> +fi
> +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_path_EGREP" >&5
> +$as_echo "$ac_cv_path_EGREP" >&6; }
> + EGREP="$ac_cv_path_EGREP"
> +
> +
> +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for big endian" >&5
> +$as_echo_n "checking for big endian... " >&6; }
> +if ${libc_cv_arc_be+:} false; then :
> +  $as_echo_n "(cached) " >&6
> +else
> +  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> +/* end confdefs.h.  */
> +#ifdef __BIG_ENDIAN__
> +                      yes
> +                     #endif
> +
> +_ACEOF
> +if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
> +  $EGREP "yes" >/dev/null 2>&1; then :
> +  libc_cv_arc_be=yes
> +else
> +  libc_cv_arc_be=no
> +fi
> +rm -f conftest*
> +
> +fi
> +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $libc_cv_arc_be" >&5
> +$as_echo "$libc_cv_arc_be" >&6; }
> +if test $libc_cv_arc_be = yes; then
> +  # For shlib-versions.
> +  $as_echo "#define HAVE_ARC_BE 1" >>confdefs.h
> +
> +  config_vars="$config_vars
> +default-abi = arcbe"
> +else
> +  config_vars="$config_vars
> +default-abi = arcle"
> +fi

Ok.

> diff --git a/sysdeps/arc/configure.ac b/sysdeps/arc/configure.ac
> new file mode 100644
> index 000000000000..cb490e47b356
> --- /dev/null
> +++ b/sysdeps/arc/configure.ac
> @@ -0,0 +1,26 @@
> +GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
> +# Local configure fragment for sysdeps/arc.
> +
> +AC_DEFINE(PI_STATIC_AND_HIDDEN)
> +libc_cv_have_sdata_section=no
> +
> +# For ARC, historically ; was used for comments and not newline
> +# Later # also got added to comment list, but ; couldn't be switched to
> +# canonical newline as there's lots of code out there which will break
> +libc_cv_asm_line_sep='`'
> +AC_DEFINE_UNQUOTED(ASM_LINE_SEP, $libc_cv_asm_line_sep)
> +
> +# For big endian ABI, generate a symbol for selecting right dynamic linker
> +AC_CACHE_CHECK([for big endian],
> +  [libc_cv_arc_be],
> +  [AC_EGREP_CPP(yes,[#ifdef __BIG_ENDIAN__
> +                      yes
> +                     #endif
> +  ], libc_cv_arc_be=yes, libc_cv_arc_be=no)])
> +if test $libc_cv_arc_be = yes; then
> +  # For shlib-versions.
> +  AC_DEFINE(HAVE_ARC_BE)
> +  LIBC_CONFIG_VAR([default-abi], [arcbe])
> +else
> +  LIBC_CONFIG_VAR([default-abi], [arcle])
> +fi

Ok.

> diff --git a/sysdeps/arc/nptl/Makefile b/sysdeps/arc/nptl/Makefile
> new file mode 100644
> index 000000000000..42be62451749
> --- /dev/null
> +++ b/sysdeps/arc/nptl/Makefile
> @@ -0,0 +1,22 @@
> +# NPTL makefile fragment for ARC.
> +# Copyright (C) 2020 Free Software Foundation, Inc.
> +#
> +# This file is part of the GNU C Library.
> +#
> +# The GNU C Library is free software; you can redistribute it and/or
> +# modify it under the terms of the GNU Lesser General Public
> +# License as published by the Free Software Foundation; either
> +# version 2.1 of the License, or (at your option) any later version.
> +#
> +# The GNU C Library is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +# Lesser General Public License for more details.
> +#
> +# You should have received a copy of the GNU Lesser General Public
> +# License along with the GNU C Library.  If not, see
> +# <https://www.gnu.org/licenses/>.
> +
> +ifeq ($(subdir),csu)
> +gen-as-const-headers += tcb-offsets.sym
> +endif

Ok.

> diff --git a/sysdeps/arc/preconfigure b/sysdeps/arc/preconfigure
> new file mode 100644
> index 000000000000..a79db0239ae6
> --- /dev/null
> +++ b/sysdeps/arc/preconfigure
> @@ -0,0 +1,14 @@
> +case "$machine" in
> +arc*)
> +  base_machine=arc
> +  machine=arc
> +
> +  gccfloat=`$CC $CFLAGS $CPPFLAGS -E -dM -xc /dev/null | grep __ARC_FPU_| wc -l`
> +  if test "$gccfloat" != "0"; then
> +    with_fp_cond=1
> +  else
> +    with_fp_cond=0
> +  fi
> +  ;;
> +
> +esac

Ok.

> diff --git a/sysdeps/unix/sysv/linux/arc/Implies b/sysdeps/unix/sysv/linux/arc/Implies
> new file mode 100644
> index 000000000000..7f739a0340b6
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/arc/Implies
> @@ -0,0 +1,3 @@
> +arc/nptl
> +unix/sysv/linux/generic/wordsize-32
> +unix/sysv/linux/generic
> diff --git a/sysdeps/unix/sysv/linux/arc/Makefile b/sysdeps/unix/sysv/linux/arc/Makefile
> new file mode 100644
> index 000000000000..25d7bbecac07
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/arc/Makefile
> @@ -0,0 +1,29 @@
> +ifeq ($(subdir),stdlib)
> +gen-as-const-headers += ucontext_i.sym
> +endif
> +
> +ifeq ($(subdir),signal)
> +sysdep_routines += sigrestorer
> +endif
> +
> +ifeq ($(subdir),misc)
> +# MIPS/Tile-style cacheflush routine
> +sysdep_headers += sys/cachectl.h
> +sysdep_routines += cacheflush
> +endif
> +
> +ifeq ($(subdir),elf)
> +ifeq ($(build-shared),yes)
> +# This is needed for DSO loading from static binaries.
> +sysdep-dl-routines += dl-static
> +endif
> +endif
> +
> +abi-variants := arcle arcbe
> +
> +ifeq (,$(filter $(default-abi),$(abi-variants)))
> +$(error Unknown ABI $(default-abi), must be one of $(abi-variants))
> +endif
> +
> +abi-arcle-condition := !defined __BIG_ENDIAN__
> +abi-arcbe-condition := defined __BIG_ENDIAN__

Ok.

> diff --git a/sysdeps/unix/sysv/linux/arc/Versions b/sysdeps/unix/sysv/linux/arc/Versions
> new file mode 100644
> index 000000000000..292f1974b02a
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/arc/Versions
> @@ -0,0 +1,16 @@
> +ld {
> +  GLIBC_PRIVATE {
> +    # used for loading by static libraries
> +    _dl_var_init;
> +  }
> +}
> +libc {
> +  GLIBC_2.32 {
> +    _flush_cache;
> +    cacheflush;
> +  }
> +  GLIBC_PRIVATE {
> +    # A copy of sigaction lives in libpthread, and needs these.
> +    __default_rt_sa_restorer;
> +  }
> +}

Ok.

> diff --git a/sysdeps/unix/sysv/linux/arc/configure b/sysdeps/unix/sysv/linux/arc/configure
> new file mode 100644
> index 000000000000..56ec14357507
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/arc/configure
> @@ -0,0 +1,4 @@
> +# This file is generated from configure.in by Autoconf.  DO NOT EDIT!
> + # Local configure fragment for sysdeps/unix/sysv/linux/arc.
> +
> +arch_minimum_kernel=5.1.0

Ok.

> diff --git a/sysdeps/unix/sysv/linux/arc/configure.ac b/sysdeps/unix/sysv/linux/arc/configure.ac
> new file mode 100644
> index 000000000000..8af5a12cc248
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/arc/configure.ac
> @@ -0,0 +1,4 @@
> +GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
> +# Local configure fragment for sysdeps/unix/sysv/linux/arc.
> +
> +arch_minimum_kernel=5.1.0

Ok.

> diff --git a/sysdeps/unix/sysv/linux/arc/ldconfig.h b/sysdeps/unix/sysv/linux/arc/ldconfig.h
> new file mode 100644
> index 000000000000..0d6368e4df02
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/arc/ldconfig.h
> @@ -0,0 +1,27 @@
> +/* ldconfig default paths and libraries.  Linux/RISC-V version.
> +   Copyright (C) 2020 Free Software Foundation, Inc.
> +   This file is part of the GNU C Library.
> +
> +   The GNU C Library is free software; you can redistribute it and/or
> +   modify it under the terms of the GNU Lesser General Public
> +   License as published by the Free Software Foundation; either
> +   version 2.1 of the License, or (at your option) any later version.
> +
> +   The GNU C Library is distributed in the hope that it will be useful,
> +   but WITHOUT ANY WARRANTY; without even the implied warranty of
> +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +   Lesser General Public License for more details.
> +
> +   You should have received a copy of the GNU Lesser General Public
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#include <sysdeps/generic/ldconfig.h>
> +
> +#define SYSDEP_KNOWN_INTERPRETER_NAMES 		\
> +  { "/lib/ld-linux-arc.so.2", FLAG_ELF_LIBC6 },	\
> +  { "/lib/ld-linux-arceb.so.2", FLAG_ELF_LIBC6 },
> +
> +#define SYSDEP_KNOWN_LIBRARY_NAMES 	\
> +  { "libc.so.6", FLAG_ELF_LIBC6 },	\
> +  { "libm.so.6", FLAG_ELF_LIBC6 },

Ok.

> diff --git a/sysdeps/unix/sysv/linux/arc/shlib-versions b/sysdeps/unix/sysv/linux/arc/shlib-versions
> new file mode 100644
> index 000000000000..343c0a04500e
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/arc/shlib-versions
> @@ -0,0 +1,7 @@
> +DEFAULT                 GLIBC_2.32
> +
> +%ifdef HAVE_ARC_BE
> +ld=ld-linux-arceb.so.2
> +%else
> +ld=ld-linux-arc.so.2
> +%endif
> 
Ok.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
