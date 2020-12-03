Return-Path: <SRS0=5ghb=FH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BAEC433FE
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Dec 2020 16:54:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DC4D207A5
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Dec 2020 16:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DC4D207A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u8MTY3LznFZ/TVXrkP2GU9kHpAp4P5hzvsK/9UX1884=; b=gszEeyHlOmOv0IkjtULDYdSUJ
	moquIgcJHSMgyKmBfFirnenN38X/+BB2zanGAaD5msYY+CVGyAxdoR7CVvfc0OKMMD0TGYTnnl3Ut
	+3klTj/xaNtRa4WQlWNklNdHjhVDKle/OO5oRS8JTjHXWlbWVjcyP0twg4I2clg++SkmolVlkoN2H
	GT5CjkX1gFDquDgTCbhxIVeUBvLEpvh66Ky6MZZ4PTW8f/JhNl0N95j3Lu+wtO36DmKkbqmVhbrB0
	AZizkCgHB/xadtwX/fCCoWCjpRpICkyLmHtawzom5hREy/avBCfSuTjimODDNLic2biyeNDij+xo5
	l4YT1IDAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkrs2-0001qC-77; Thu, 03 Dec 2020 16:54:18 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkrs0-0001pY-Bu
 for linux-snps-arc@lists.infradead.org; Thu, 03 Dec 2020 16:54:17 +0000
Received: by mail-yb1-xb43.google.com with SMTP id x17so2629777ybr.8
 for <linux-snps-arc@lists.infradead.org>; Thu, 03 Dec 2020 08:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sc3zJY2XCC7qzbfH5kEOpZBt6CKRXKC3SpULJ362er4=;
 b=c1Bfohhh3QQaOdN8hl606iz5E8HFEElpZl4ZMs7vf1Vr+DgLlLqMUYr00ZNV3mv1mp
 1uudy3oGJRzX7GwBWArh9grtthKY+8T+j21SUTbIW1cwl6Qc5YOOokGMwuToAIo5GG13
 jlNXiGgvdThIGlYRCmGFLt5t/01W2J7jJvQRyha8E5sSpQzLw35JJGgOdP/J5zdetyXS
 vZcQVTlosa4wjCS8c6S8QnVRp9XMdaFq/8/9GsjHCF9ES4+Bcm89+/BsSLykh3iZnyKG
 L0AIPDveb+3ei+SIqmMsz0rRa61iKfmKol0gIk7+U2bkKKz/OmRQrc7+1R+DciVlq5MM
 D0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sc3zJY2XCC7qzbfH5kEOpZBt6CKRXKC3SpULJ362er4=;
 b=MwSHB+Vz+YixawyTtxxWmMSl+YFXe0aPEKG2D0unLvJvZxcZZ/dTRmyLP4fhU7Db3h
 MK2P8RipuQsfXvgfCHbEk6q8F6lvBY5tc3CJqmPdXRBFxsscoV6M46YJZFAM1Nz+qndT
 cUkX94UHQV1lTQihgMG3dPAsaoYiyMQ/swGRS/tthWvZVZCbXjmmUhsR2Qxk3ip+zaxU
 9uGSfixrILqTh4UrQTW9iINM07V/XAXJwVJfEj5wHB2mSp4sPjLO8AFvpWmyu4Me0dzn
 evKq2WLAzZYUR2cmK95vqdoCDeRizHW/Hlf98V1L4oCW68LoylT1or1NrGqNGZ3YGjEK
 wGsA==
X-Gm-Message-State: AOAM530TsXR3FlyrhY/FEGwWC72Bx8fRhcuRLAz2uGrNRX4OHtD2duQo
 4GROY8tLxevwKdEbIzNHLvdjcxRt4qpT4R46yck=
X-Google-Smtp-Source: ABdhPJwtn8HkCnO6ER7/vRpbgqtlpQRucEUWrn7lY6MPzUJ7En6tJ0VrUODOe1KwB2OIgKdvjfEjonDiRBmcLAJ5t/4=
X-Received: by 2002:a25:d713:: with SMTP id o19mr5935849ybg.378.1607014452380; 
 Thu, 03 Dec 2020 08:54:12 -0800 (PST)
MIME-Version: 1.0
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-7-cupertinomiranda@gmail.com>
 <74cfc5bd-d02c-768b-37e4-18ff8c88656b@linaro.org>
 <CAHW_PjKs5LDkrFkqSGEKgw4sL3tuyc3-n6Uo4xYfHa8=376_Ew@mail.gmail.com>
 <1dbd9a59-8e6a-ee80-f7ae-a2990a059b21@linaro.org>
In-Reply-To: <1dbd9a59-8e6a-ee80-f7ae-a2990a059b21@linaro.org>
From: Cupertino Miranda <cupertinomiranda@gmail.com>
Date: Thu, 3 Dec 2020 16:54:01 +0000
Message-ID: <CAHW_Pj+0Ex_PWhUzv_Fkcp2B5yOcD=p31Lu2xH+Xp9M6mAf4Vw@mail.gmail.com>
Subject: Re: [PATCH 06/15] arc: TCG instruction definitions
To: Richard Henderson <richard.henderson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_115416_428521_332D3E46 
X-CRM114-Status: GOOD (  22.24  )
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
Cc: Claudiu Zissulescu <claziss@gmail.com>, qemu-devel@nongnu.org,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Richard,

Thanks for your quick reply, and again, thanks for the reviews.
We have already started to make very significant changes to the port
based on your comments. ;-)

Our generation tool has different levels of verbosity, expressing
instruction semantics from a pattern level up to what it is shown in
<semfunc.c> as comments, which is later converted to TCG format.
For QEMU purposes I would say that input format should be what is
shown as comments in <semfunc.c> file.

I believe that I can in relative short time isolate the TCG generator
and prepare a tool to process those comments and update the respective
TCG definitions.
Also, as is, the generator is done in Ruby, and to be honest, would
not be very easy to redo in some other language. Would this be
considered a problem if we would include it as Ruby code ?
IMO execution of these scripts should not be a step of build process
but rather a development one, such that Ruby does not become a
requirement to build QEmu.

Thanks,
Cupertino


On Thu, Dec 3, 2020 at 4:08 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/2/20 6:55 AM, Cupertino Miranda wrote:
> > I totally understand your concerns with generated code.
> >
> > To explain our decision, we have an internal database that we are able
> > to describe the architecture and map encoding with hw semantics, and
> > for the sake of saving us debug time generating each and every
> > instruction, we use it to generate both the TCG and instruction
> > decoding tables that you have already reviewed.
> > This tool is not only used in QEmu but through all our tools code,
> > allowing us to cross validate the content of the database.
> >
> > Considering our situation and current state of the port, what would
> > you think is a reasonable compromise?
>
> In some respects you're in the same situation as the hexagon target that's
> currently in flight on the list -- both of you are wanting to generate tcg from
> a company-specific canonical source.
>
> In the case of hexagon, the target/hexagon/imported/ subdirectory contains a
> bunch of stuff exported from Qualcomm's specification.  It's not fantastically
> readable, but it's not bad.  These files are then massaged in various ways to
> produce either (1) out-of-line helpers or (2) inline tcg stuff.
>
> Without knowing what form the Synopsys database takes, how easy would it be to
> export something mostly human-readable, which could then be processed by a tool
> that is included in the qemu source?
>
> Future qemu maintainence is thus on the tool, and not on the auto-generated
> code.  There's also clear separation on what needs tcg review and what's simply
> a spec update.
>
>
> r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
