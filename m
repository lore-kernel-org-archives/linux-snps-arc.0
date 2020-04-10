Return-Path: <SRS0=lTgm=52=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD589C2BA2B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Apr 2020 12:26:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB0FD2078E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Apr 2020 12:26:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GCT7wcKP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXEOrXhG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB0FD2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtMW5f5Qe4wGrWUkyZBqbydcO1gjPE9F89hQf4wWC/U=; b=GCT7wcKPXs2zoN
	SdbLoZGmwsf3P0k/3fd6W2L/T1INAPDp+rNt5L95Xmc8r+fclhNrTTVNiiRUdSVxMOsL97s/dQdvU
	41FeGDA6gT/iSZMU6WOzdBJXhNSSqTnhvGDJsUjL7r9fYzmJT51Yf8lzFpD+TB/Wr4E4O4tJF8j6B
	vvqxH5B69oigY5aHDZE/e5wLAb8q78/LIf9e60Vz5IK0lix+3eW0oU9TqIEmen8rnEKvrSN+0ciDW
	LPSHyT/+xRy6YgodO7d552bVDqgyVxRpdCBPqaqK7KL0O0gAeSvcpnfwM5o8aCpVnqXOwCmnRkBkU
	bTq6aZccnCgjU9q0J9hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMsjP-0005aX-MP; Fri, 10 Apr 2020 12:25:59 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMsjM-0005Zq-Hx
 for linux-snps-arc@lists.infradead.org; Fri, 10 Apr 2020 12:25:58 +0000
Received: by mail-ua1-x935.google.com with SMTP id a6so565693uao.2
 for <linux-snps-arc@lists.infradead.org>; Fri, 10 Apr 2020 05:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jKuDLDsHWshF5yvY0jgeiyAmI7igCf0RSWzymhUvYJ8=;
 b=dXEOrXhG/oeMd/eZVegN+2O9DhLaP2bdAScBNkpTifozjirQtF7vAFm7XMS67mHFjz
 V0QRR0aKDaCVKEH53Q1GzPRX45nGprJRtP2yKpv8tfLnVU12I4k9PTPqjpEDQsFPoZgy
 rqD2og145qksMih3VTA+fCZbehtBot8025VzygKCGo92NARvgeAAl8a2nyO7gekLIWMN
 wtWC5xfl2pZmUHzM61ClbAfFrpXVb/cJ4jyMGJMsnrAFh263RXwYsETwvXOeRMqRh8xy
 athdct+KO19LI+7cnYewLAGH973bYzhukUH0qXsO0kQZ65mX0IEpnxOm8CB/CntALrot
 XJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jKuDLDsHWshF5yvY0jgeiyAmI7igCf0RSWzymhUvYJ8=;
 b=sqEC2Ffc1Xx9kfhF4ZJQ8mTTUxBKH8SUTSd0incrM0nn77MOlnHDu2PBZa250LWaqv
 DXmxxFaThRGbYEnnvWFKUySIauzJOkq8MwxsKvVMtjoXCFVQKTQPlo9Gyud8pUJfAFre
 sCxH5Pb4qS7aJwHgNhT5RcwxVUwczjPbmxdCT8c+H/CARoZxqnJvSZ5wJZTwLZBz8mSz
 SEge/s83BHD0qG3kOS3ps1o6DVVwKC7+t9F5i4uoXF/+WQ7w29xBQ+zL2XHvNiN7Jv62
 Wz1HY9qemvG00IO7tqQeHhdI2YOfxKdOF5nv27zvp9gFFGV75x9qpqc/uyWrmorp/uKd
 2egw==
X-Gm-Message-State: AGi0PubXn6+vNJFsQwyjQIgP5Gb8JWqJs25mDl/cFQ9wJZz5enuR+Mr7
 GfGrmReeQ16MlU6LbYB3Zquw+sij6zjQFOxQIfZ2+rAC
X-Google-Smtp-Source: APiQypLRxPVIgyH3kmsT0zKj9IpKiWvIJsnuVWLGlpOQ6vhVoebG8D9QNVvachQZIve03PX0xZfDjXNbP5w9Cyiedv8=
X-Received: by 2002:ab0:1331:: with SMTP id g46mr2876163uae.72.1586521553775; 
 Fri, 10 Apr 2020 05:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200329000503.27897-1-vgupta@synopsys.com>
 <CAL0iMy0f0tt6UtBRyT1hn=FsvF5tBYVKmcxHq57rDbc9YEtO0A@mail.gmail.com>
 <7f81729a-6912-dc79-848b-4cdfa821d93b@synopsys.com>
In-Reply-To: <7f81729a-6912-dc79-848b-4cdfa821d93b@synopsys.com>
From: Claudiu Zissulescu Ianculescu <claziss@gmail.com>
Date: Fri, 10 Apr 2020 15:25:41 +0300
Message-ID: <CAL0iMy2A1mj3HHg3s2OHqriDTCmPqU3TNLHvqULjDz5tEvkH9w@mail.gmail.com>
Subject: Re: [PATCH] [ARC] Allow more ABIs in GLIBC_DYNAMIC_LINKER
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_052556_618491_4C5AD6A6 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "gcc-patches@gcc.gnu.org" <gcc-patches@gcc.gnu.org>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Done.

Thank you for your support,
Claudiu

On Thu, Apr 9, 2020 at 2:38 AM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>
> Hi Claudiu,
>
> For glibc needs can this be backported to gcc-9 please !
>
> Thx,
> -Vineet
>
> On 3/31/20 3:06 AM, Claudiu Zissulescu Ianculescu wrote:
> > Pushed.
> >
> > Thank you,
> > Claudiu
> >
> > On Sun, Mar 29, 2020 at 2:05 AM Vineet Gupta via Gcc-patches
> > <gcc-patches@gcc.gnu.org> wrote:
> >> Enable big-endian suffixed dynamic linker per glibc multi-abi support.
> >>
> >> And to avoid a future churn and version pairingi hassles, also allow
> >> arc700 although glibc for ARC currently doesn't support it.
> >>
> >> gcc/
> >> xxxx-xx-xx  Vineet Gupta <vgupta@synopsys.com>
> >> +
> >> +       * config/arc/linux.h: GLIBC_DYNAMIC_LINKER support BE/arc700
> >>
> >> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> >> ---
> >>  gcc/ChangeLog          | 4 ++++
> >>  gcc/config/arc/linux.h | 2 +-
> >>  2 files changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/gcc/ChangeLog b/gcc/ChangeLog
> >> index 86ad683a6cb0..c26a748fd51b 100644
> >> --- a/gcc/ChangeLog
> >> +++ b/gcc/ChangeLog
> >> @@ -1,3 +1,7 @@
> >> +2020-03-28  Vineet Gupta <vgupta@synopsys.com>
> >> +
> >> +       * config/arc/linux.h: GLIBC_DYNAMIC_LINKER support BE/arc700
> >> +
> >>  2020-03-28  Jakub Jelinek  <jakub@redhat.com>
> >>
> >>         PR c/93573
> >> diff --git a/gcc/config/arc/linux.h b/gcc/config/arc/linux.h
> >> index 0b99da3fcdaf..1bbeccee7115 100644
> >> --- a/gcc/config/arc/linux.h
> >> +++ b/gcc/config/arc/linux.h
> >> @@ -29,7 +29,7 @@ along with GCC; see the file COPYING3.  If not see
> >>      }                                          \
> >>    while (0)
> >>
> >> -#define GLIBC_DYNAMIC_LINKER   "/lib/ld-linux-arc.so.2"
> >> +#define GLIBC_DYNAMIC_LINKER   "/lib/ld-linux-arc%{mbig-endian:eb}%{mcpu=arc700:700}.so.2"
> >>  #define UCLIBC_DYNAMIC_LINKER  "/lib/ld-uClibc.so.0"
> >>
> >>  /* Note that the default is to link against dynamic libraries, if they are
> >> --
> >> 2.20.1
> >>
> > _______________________________________________
> > linux-snps-arc mailing list
> > linux-snps-arc@lists.infradead.org
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.infradead.org_mailman_listinfo_linux-2Dsnps-2Darc&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=7FgpX6o3vAhwMrMhLh-4ZJey5kjdNUwOL2CWsFwR4T8&m=MrObyH2ki95_7m_xHpnWX-k9eIMOsxMuSa48qhxYOCY&s=3ggbGwaiJuSFnFECy0ItuwBBMDAcriwCdSc3GA0UFig&e=
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
