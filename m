Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B88CC3DA4B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Jul 2024 04:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kTzAfVT0Vpv1h8ngLucOVlWwd2cy5PfnMhG8XEkBTN8=; b=gVIG8WtB8aPyD8
	Om9y+RM952io/qSRBcjE7wLX+FYyIwEJ2JncbNYmKyod6Iv0EOzNinb4mJ+SvLtmrIgWtnwc59kv4
	0KRKLEmSI5RsTEjChzszrTN7lOkD3pNJT5eI63T3q5Bq+FNObtwD+VDyNdgqAl7H/mO6f6wrZhEjM
	2thFJl9N4VucA5iAERN1lRsoz44sKZRRUos51GHRf/ctBIl1OG/eCg+V5bZhktNsEMuYgy9Qj3oHN
	YnyqM22pA22bclijFpUBjJFQAH/FttMyvJwaCJi/yr2VuSMFWAgsC3gbAwLC8KhW7f9+nYFeGeQm0
	FEK7WsRyf4PXFTARRvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTwkO-0000000CeOH-2RT3;
	Wed, 17 Jul 2024 04:58:36 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTwk3-0000000CeJi-27X0
	for linux-snps-arc@lists.infradead.org;
	Wed, 17 Jul 2024 04:58:17 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52e99060b0dso6770267e87.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 16 Jul 2024 21:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721192293; x=1721797093; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EAXDs4QhymT5qdSIqwghPBIT7eGCMQME0KsEWD+9hyo=;
        b=DF+cEwh/Oq7kO+Iw1bpNh0Bs7n1JpSIzMgKP7mtHxVdsSURqv3COkjWvEzWHwdX3Ru
         Avl5oHu0byKGRe8CjlBOTYPDV93dERn3P2Kk+dJoAr5PRP+ipCEnNuUSo09WZKWxhAJN
         4zJbbyxv8GGJvHxL6tCE99EQ7EDHcBZWdpvHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721192293; x=1721797093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAXDs4QhymT5qdSIqwghPBIT7eGCMQME0KsEWD+9hyo=;
        b=RlUECbI4wXdaURZBrmtTvmR8bMA7SUKdvybNST/SXyo0ONDTAaJyzHS5jCB+dyOsL0
         usO/c3wsfUuu0BoNNfdZZ1qS1PQ8RjVASdGqRYlOFsxb2X+ZhRwp/oC8nvmaUujPEcUc
         OaKGXQKzv+qOxmqIHCwy6h90YrxRtnQJniiTLsOysRpVujoI8eq6kFh4PeHEE3K7L7kT
         uReM0HfQGyn1rzIBHbi7woRhjmbNx8OEdFghTes/hEVRvjrNgloBUlpZjiebK7jzcd4V
         FUlUXOPcSljIKglZVo1MiiHBknTY66icX65Zq2Y43BJMRAwY7iFQ7RvWr5j18bV109a7
         LVoA==
X-Forwarded-Encrypted: i=1; AJvYcCV7R7pLCinTI8yng+6fGMDDVP5+qvieB5m7IxlcZxRusPHQDLWEEoGPQrqTiBU0l/rXloH8vEPpZyEM+2w4A4KQbgU0dhXaX4IG6trLreDlCD82
X-Gm-Message-State: AOJu0YwoKfftA1rBgHOn1sZGHEtxvljj2Jq48ST2r+ihvE6R955c1v1N
	KskSgHNzS8Xwa6cbr+Va3vK9N7mtx6vJ+uaV1YoWuIHbgin0xPuwFAnBDK0UkK+eaZkPt+ESjIQ
	VhiRVGQ==
X-Google-Smtp-Source: AGHT+IGBnrXh9sV4u5prVrOewqo0+RS7IWk2Io1iAZvOukJJlzjKaQ47K2vTVuo3gsg1TCKXAJ3dxA==
X-Received: by 2002:a05:6512:3408:b0:52c:de8f:2e6c with SMTP id 2adb3069b0e04-52ee5441f3fmr310976e87.57.1721192293221;
        Tue, 16 Jul 2024 21:58:13 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5a3a0bsm400561666b.3.2024.07.16.21.58.12
        for <linux-snps-arc@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 21:58:12 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-58bac81f40bso7700755a12.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 16 Jul 2024 21:58:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCCGZiYgcN6DhGUqRqAX2ekIYwWDvcRf4T+VpjeiA1vtWiVWf0ICNMJtysujYPviU2CYLwrDI7iC7u9iS2zQ/pGW5BQyQpDQKJXIuv8T9AKgqz
X-Received: by 2002:a05:6402:5244:b0:57d:4d7:4c06 with SMTP id
 4fb4d7f45d1cf-5a05b7ee599mr504374a12.13.1721192292251; Tue, 16 Jul 2024
 21:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <a662962e-e650-4d99-bed2-aa45f0b2cf19@app.fastmail.com>
 <CAHk-=wibB7SvXnUftBgAt+4-3vEKRpvEgBeDEH=i=j2GvDitoA@mail.gmail.com> <d7d6854b-e10d-473f-90c8-5e67cc5d540a@app.fastmail.com>
In-Reply-To: <d7d6854b-e10d-473f-90c8-5e67cc5d540a@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Jul 2024 21:57:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wir5og_Pd6MBSDFS+dL-bxoBix03QyGheySeeWPX82SDw@mail.gmail.com>
Message-ID: <CAHk-=wir5og_Pd6MBSDFS+dL-bxoBix03QyGheySeeWPX82SDw@mail.gmail.com>
Subject: Re: [GIT PULL] asm-generic updates for 6.11
To: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, 
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-snps-arc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_215815_577685_6BDDE5BF 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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

On Tue, 16 Jul 2024 at 21:44, Arnd Bergmann <arnd@arndb.de> wrote:
>
> I don't see those either (this is an x86 defconfig example):

Note, it really might be just 'allmodconfig'. We've had things that
depend on config entries in the past, eg the whole
CONFIG_HEADERS_INSTALL etc could affect things.

And yes, I build everything in the source tree, so $(obj) is $(src). I
find the whole "separate object tree" model incomprehensible, and
think it's a result of people using CVS or something like that where
having multiple source trees is hard.

              Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
