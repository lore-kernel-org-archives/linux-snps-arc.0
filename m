Return-Path: <SRS0=2K9J=JS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEB9C433ED
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 11:58:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 741F96144C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 11:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 741F96144C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fY1+gJehvSEUq4FXtq3OELvO++96HYSmbgnETYhOHwk=; b=OJN1J/aYMnJklcynQc8QR61JI
	8+Y1smLcoJQweSoUookqC+owrh7ueBishJ+gta0rJA5Ha/yDT31gCTDF5EKPh4aSn3UQ2zoizHebm
	PwB4YtXRl0E9s2BuqB1kztVTxsAerejHELQ0LJTEFOYWo0fVILz1u8MD0lPnMn/nS6y9WElnJ+kwG
	CHj9xDc4g6NFdNcvwiBUcwL6Fi/7DQ/3+a2fd2KuSGGokOQuy4/tS5hKOOwOxy8rl48FlsqDDv/4l
	y9cMC1KuVPv9A9tWM+AOUIDt4xQ4BEjBYpeGnJcuETnW+st+SoiB+HwcBGyjxty2tunQtMNsK+n20
	VMaPciaRA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZBUY-00ELK6-9g; Wed, 21 Apr 2021 11:58:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZBUW-00ELJm-IW
 for linux-snps-arc@desiato.infradead.org; Wed, 21 Apr 2021 11:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ollGuOmsPx94rw2T0PCZHYaSO47mOMeUsry14ZvLfJM=; b=QcwwEG1VKndSeiqZL+GiGpSj/7
 UUbE0s3tFf4zD0YSTO8CZJjIdfaghEj4GGTeVOTs4rIORGgVyVxfT7oHqytPD4Izk5ZNe68Fr6ul/
 qDorYNL5NjC+E8lv1JufFyFgRDYC1WuxMD/T4Fct8bf8Mdidg5rf35HWNdiBBT359KdFilVoggOid
 kBg6vP4/5DdJuRKJB8OQ1PRtZFNjpao6aasE8yb8xv65ma6neuRCAdMb/bmR1HUdpT1z4qUXE5NCK
 /4D5ZZBSY3sJZSfu4cn5j/IPUm4o5Hqi5kKJUNtbS8bAkrCi0vfV1hOJTrWbg2Mu+yVtyPB2B4IIG
 YfHw6eAQ==;
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZBUT-00CqnE-OU
 for linux-snps-arc@lists.infradead.org; Wed, 21 Apr 2021 11:57:59 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Ma1wa-1m5Akn28MG-00W20o for <linux-snps-arc@lists.infradead.org>; Wed, 21
 Apr 2021 13:57:53 +0200
Received: by mail-wr1-f48.google.com with SMTP id c4so2163097wrt.8
 for <linux-snps-arc@lists.infradead.org>; Wed, 21 Apr 2021 04:57:53 -0700 (PDT)
X-Gm-Message-State: AOAM532x57B+g6Z3SiBsvdYrSWAz8JG54bhgxPAgTuMv85HITODz0lD+
 p4zdgHZZsRaYW/YIIKeRd48v7KOMdIFeKzUG90I=
X-Google-Smtp-Source: ABdhPJxxLHU622QUTxVLT5JG28FXBqbMwoP9QmuTk81YvLLEEGjqqeD8jwt159GM0E527X3eKOyaGZAiRaJowXbS4kU=
X-Received: by 2002:adf:c70b:: with SMTP id k11mr27161191wrg.165.1619006273000; 
 Wed, 21 Apr 2021 04:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210421111759.2059976-1-schnelle@linux.ibm.com>
 <20210421111759.2059976-4-schnelle@linux.ibm.com>
 <bb21141706d7477794453f7f52f6bc98@AcuMS.aculab.com>
 <aac9ac52de09ff7162fc7caa6e817258d9dd313d.camel@linux.ibm.com>
In-Reply-To: <aac9ac52de09ff7162fc7caa6e817258d9dd313d.camel@linux.ibm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 21 Apr 2021 13:57:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0uXo+CLs2emsXE=-Zr+FjxV5k7AWNdGrN0fa37gwub8w@mail.gmail.com>
Message-ID: <CAK8P3a0uXo+CLs2emsXE=-Zr+FjxV5k7AWNdGrN0fa37gwub8w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] asm-generic/io.h: Silence -Wnull-pointer-arithmetic
 warning on PCI_IOBASE
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: David Laight <David.Laight@aculab.com>, Vineet Gupta <vgupta@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>, 
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
X-Provags-ID: V03:K1:BqSOneFcw0W6eYN40nfdDYqAUesT7jNsvfLjz0keYhQfKeua+Vq
 9Y3CUDe3o1MaOSNQf262eDsS43w4GJsFIcvNTKTUYEJ93dl3qmuRPket5bt5eCdUEsGz2Ct
 PTRg7SB4V531EbaldHfm6EfqYBXqngtdZm2dupbBvZ8Vmos79NGHkRAOv6V1DmhRLTi/BAe
 1mqHbiOU2WlGmFLnTWtvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:USGAqJqTzi4=:lo/hEvhUU4eHzjINhh4+s/
 7J+6bzgLU9g87uiXTu8LR9T+wqOb0HKnxm5wVZYmvLTDODl3a/lpA61TlN3Kq38OV4hIx3ubp
 +UDemmbS35C9hlpqkiAmc8DN7k462pHKlQD1IpPG3ULD7sotnAsAU2mTrIHEr0R1XPKf1NHn1
 CPrw/m+7vI0w5rCsXAsPmzA9UsuAU7666eTJ5BI/EZtTtoqUpWAR6uVhrvwnvXkzDMBnQ27Z3
 QY7O4zj/Wc4RgHv1OHEhFFrJF7+8cVFGMn5hPxSpABFOkWXNKhD7kQyNkHlDbZwRPOOrxy99k
 ozoXCs+05z9EWABpiM4dMihH1s7VfSrhSbqUGHv7X3h5Q813zHX1uiCIzsLMxAu4w+pQHFy/U
 QxtvyTrWBaUvqqTwvH3oveDprx2Gx4y+g2L4edxfYt153/h1PR//XZ3PcLO8X7X6CXcdP99Yz
 JsfoCxcwG5WA8tiEE7WynZ7uI/h8o8+Fc0JpFZjKvTBFMphYgeZon+FtU0iiXYmqHXhDfXN1+
 5yxKBBZAeuWV0y+ZCIheKc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_045758_171807_64C748F7 
X-CRM114-Status: GOOD (  17.99  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Apr 21, 2021 at 1:50 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> On Wed, 2021-04-21 at 11:24 +0000, David Laight wrote:
> >
> > I suspect that this might be better not inlined
> > when PCI_IOBASE is undefined.
> >
> > Otherwise you get quite a lot of bloat from all the
> > WARN_ONCE() calls.
>
> Hmm, I was wondering if we should rather have a large ifdef block of
> all these functions stubbed to WARN_ONCE rather than in each function.
> As I understand it this would be necessary if we want the inline gone.
> They would still be static though so we still get a copy per
> compilation unit that uses it or am I misunderstanding?

I wouldn't worry too much about the size of known broken drivers during
compile testing. Also, since the functions are marked 'inline' and not
'__always_inline', the compiler is free to decide not to inline them if
the contents are excessively big, and since the strings are all identical,
they should be constant-folded.

If you want to make this a little smaller, using pr_warn_once()
would be a little smaller, but also give less information.

      Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
