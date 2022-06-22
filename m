Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E49EC43334
	for <linux-snps-arc@archiver.kernel.org>; Wed, 22 Jun 2022 13:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zicheMUxpjfxqK9HJs+NZ/NCGSXzWd7j2/OSMd9FuX4=; b=z3LvoxUgHuT4Cc
	+ffWfcM1iPzOvovk/75koC652i/tOcSHNdDl3AElN2W9fKXqKMhGBKKoa3DB5fnRCy0JJorBjpVYt
	BJxJfekg1RBM0CZ0+vaJjFO6tAitlDLExgDcG369WQuagukB9LN3hKIvaZSC1WwdotIchHOErzjoU
	4X6oQ5hxONsduY0NvLmHSNokLfkynDm4GMpcVDRfTuHkTMmwcqdAt1zJnr4YT2gX+HXVXeh51g8l4
	b/5ottJynF5V6e9cQJaUbl5a0kCh2FNz6J+w8yVMeqO6A7iTPeskbVkOiUDrYuSx1k0pF22uqQWr4
	863fnMskUvS/49v/MRHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40HF-00AV5v-9d; Wed, 22 Jun 2022 13:20:13 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40HC-00AV4A-Hv
	for linux-snps-arc@lists.infradead.org; Wed, 22 Jun 2022 13:20:12 +0000
Received: by mail-pf1-x433.google.com with SMTP id d17so7126729pfq.9
        for <linux-snps-arc@lists.infradead.org>; Wed, 22 Jun 2022 06:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OSbRySHuWSrgsTpq6XAtnwt3bZpv/W9+tRxkj/bYpYs=;
        b=Qwhp+OrdMAdNWOeOaJaEnz1qGNlP1dw9UtJoiaJQQD5M8tHpEVYjnMv5PIOaEENNVn
         WIMSFX8UUPoIpa9ZoCurbMcI/uvZyYybXN1qTPAMowSR0iMvYbE6SS64TjlAUHLhaCQY
         UA9jFy6GLmf7ExWpUViVxvicpba/Q3gahmfzUM6va7UJyzmH7Fg//bZbhnsZGQ5EOIZc
         V3jB6BvBDVFZsQ0ci4KIOfSQkI/5CjY6TB543Z1sQBw5Z0Kel3k8MkV8CRpUszOpjbM4
         vFhEshNEl/PCBoAxg6afEsOuHCXYn+8STPYm4ZYbmMfffIp0RJZC0CuMZNAaEZmfEn4G
         GoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OSbRySHuWSrgsTpq6XAtnwt3bZpv/W9+tRxkj/bYpYs=;
        b=MvDvB9jjIDcjQNl1XqetfrLhXGGnDj1NKHuFgLFaWILXRBtSMs+vZ+Z68e9nLP4Ovy
         1eRt4SMNcDDxL/0u4q5JMj2oHzO5dkoqnAJhTz20qgZdHSZrLCr6x7Z76U2LouAcGxce
         nJ3C6UxbCIhZLpBNLKIBne+G93pcBqoJZSWsIVsx9GlZs08y3ZlkEha2qhxHe+dfeKQq
         Kr/OGCreTIVX4Em8mzbJawlQCzmwTKueJ7Anluer5MVbU4YINWYw0+05vYcAR15nK2wv
         8mFOp+iJGfcmkgDnmJT7+5qpbdXMWqPjmRDPu4cvjX9c+gCWLbzUMoSJl06F5OhMuvBV
         R6yw==
X-Gm-Message-State: AJIora8yKJwUlR7nFo8jm9GSzDMu/Ihly7/bS2KJVmeIYkTxcz6TVC+5
	x9l1q8x0aSS/wUicsYo/Y44=
X-Google-Smtp-Source: AGRyM1u3CuDYhKlMipHDVRcmY+JMnUFve2UiQB+/X+R5r7Xlr6SQoFTJgAy5rSwllcicH2sJtMdkCQ==
X-Received: by 2002:aa7:8091:0:b0:525:27cb:19ef with SMTP id v17-20020aa78091000000b0052527cb19efmr13944086pff.37.1655904009021;
        Wed, 22 Jun 2022 06:20:09 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-83.three.co.id. [180.214.232.83])
        by smtp.gmail.com with ESMTPSA id z6-20020a1709027e8600b0016a3b5a46efsm3400089pla.113.2022.06.22.06.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 06:20:07 -0700 (PDT)
Message-ID: <1b34e0e5-23aa-96cd-c37f-1434884ff061@gmail.com>
Date: Wed, 22 Jun 2022 20:20:03 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ARC:mm:Fix syntax errors in comments
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, "vgupta@kernel.org"
 <vgupta@kernel.org>, "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220622080423.41570-1-yuanjilin@cdjrlc.com>
 <YrLTCXLrr3HB39lv@debian.me>
 <4cef89c9-3b27-11e8-2971-66b93b847ede@synopsys.com>
 <alpine.DEB.2.22.394.2206220513590.2646@hadrien>
 <46e4b588-d35b-ec50-ad1a-8502c2903677@synopsys.com>
 <alpine.DEB.2.22.394.2206220535300.2646@hadrien>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2206220535300.2646@hadrien>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_062010_671572_96E58073 
X-CRM114-Status: GOOD (  14.08  )
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

On 6/22/22 16:38, Julia Lawall wrote:
>>> So code that is fine will have typos forever?  Fixing typos in comments
>>> doesn't break git blame for the following code.  And typos in comments
>>> give a bad impression about the state of the code in general.
>>
>> Of course not! Documentation is as important as the code, if not even more.
>> However, fixing typos to increase your commit counts to a reputable project
>> is not fine either. For instance, many of these proposed fixes are targeting
>> one single typo at a time. Couldn't they just be sent altogether!?!
> 
> I have the impression that the person is just trying to figure out the
> patch submission process.  For example, the subject lines are not
> formatter in the standard way (I sent the person a private email about
> that).  Perhaps just let him know about how you would rather have received
> the patches.

In recent times I had seen many typofix patches sent to LKML. You can see most
of them by querying `s:"fix typo"` on lore.kernel.org. Some of these patches
have been merged, though.

What I say as starter thread is "ideal" scenario as described in
Documentation/process/2.Process.rst; that is we prefer to see these minor
fixes as part of real patches work (say refactoring), rather than just being
trivial patches.

But what most reviewers here missed is how these typos are found? I guess
these can be from codespell or some other tools, or even manual review,
then send the fixes en mass.

Take a look at "fix typo in a comment" aka "delete redundant word" patches
at [1], [2], [3]. and [4].

[1]: https://lore.kernel.org/lkml/20220618132659.17100-1-wangxiang@cdjrlc.com/
[2]: https://lore.kernel.org/lkml/20220618130349.11507-1-wangxiang@cdjrlc.com/
[3]: https://lore.kernel.org/lkml/20220616163830.11366-1-wangxiang@cdjrlc.com/
[4]: https://lore.kernel.org/lkml/20220606123419.29109-1-wangxiang@cdjrlc.com/

IMHO, these patches should have been in a single, consolidated patch, since
these strip duplicate (hence redundant) word (single logical change).

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
