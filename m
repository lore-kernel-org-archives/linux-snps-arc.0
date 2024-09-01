Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8192C54FC6
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Sep 2024 06:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muL5+Nxh03DU6BAVWVRRYPbAo0+fOo9jYEhZKX4SQLc=; b=TRGOri7i9RTXD+
	cAnSdYLel0L9LTXzYHqymPeTDBijOnWMBV1efEOdkCLKhU1XJYVB7vvS7V7/6l5jC/J6hjxjiQSCK
	qOJLWdQIvCRmUzOfgzzUJyDNitjCb/7Ya/RBfDPVsBDuAAvP80wZcltwoF5MNKOeE33ymleWA1wQe
	Lb9+HDxqWfKo5zdMCWthsWW372bYSc5j5WCXdyh09gbH04R+1JTTQUNBuaaNuIVAl8eP3+Qhtgr+p
	XtJDCd+RbDrrFxNV7cREUuiLeM6atLzgtYazDfEia38feoqKua7MLSlNjcXQFsSXZLWUV7FOYMhK6
	D2mmOLTvWW4opQFwAWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skeQd-0000000B4KC-0Wny;
	Sun, 01 Sep 2024 06:51:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skeQZ-0000000B4Jf-2kUN
	for linux-snps-arc@lists.infradead.org;
	Sun, 01 Sep 2024 06:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 708265C5616
	for <linux-snps-arc@lists.infradead.org>; Sun,  1 Sep 2024 06:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D079C4CEC3
	for <linux-snps-arc@lists.infradead.org>; Sun,  1 Sep 2024 06:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725173470;
	bh=kV7gjys+8Wloie0u0pMQxji6rrpC6bQCuX+7vzpw2xY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mimhIgusInQFCzUHU9PvkKUQOVgWpHA4Vq/Y97aqhe2h06zQlJXLmqRmpEPTf1JjN
	 kLqHbqKx7xun8kBEOeYS/bxij2zQROWoqQ0nOyM1gqNOewA8VAHvkv9rX42OKFx/mJ
	 +cIdKFtnZxMkBTCUrZA0iEfxmdYfDIH13lpqyyHbUTQnt47xM1w/sHdjlRJk2ZXlIK
	 ZYtQtcVlrulphATIO1oMwhC889a4Bo3WrncP2e7FLQlFRjZ3kBGPekNEiFuPPX5EjX
	 SgKfbrgqE878AB02YE+C7Rv/238Kf4Clc5VBMZO+4AMYKfZrtmNES1YufonSG7lFGh
	 ELHM0oYgH5Z9w==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53436e04447so3362361e87.1
        for <linux-snps-arc@lists.infradead.org>; Sat, 31 Aug 2024 23:51:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+Miw0FHHzVIadQI0AnMUiKgrGQOTpU4TzHbvbfEV0bMzYabDOQJP7lDAiQP9dZRutOuLZO+kyL8I6mcx6DA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwENMAtmhtJ0KxDjS7jUwFIfaEuHP+D0NFrJJYXAyCX1dsDqbjj
	Yv2wNA5f9l7/6YAO1paS89bzewyoQfCBUVk263arlLENfOrj+J8xE08tqtbOgX7YogjoVzUj92O
	7ptNWrkfQeFEu4PKHIGhX8gCrUK4=
X-Google-Smtp-Source: AGHT+IFGL7jZC0mVVSf+pywW30GQNCHTVJuGhcv5VnimmEbUKcQnQHWJexcNhjDBgdiKnZr9CzV3TZt64vT1+JAZ7vM=
X-Received: by 2002:a05:6512:3d0d:b0:533:3f6c:f899 with SMTP id
 2adb3069b0e04-5354633a60fmr2223843e87.24.1725173469117; Sat, 31 Aug 2024
 23:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240831101045.1381258-1-masahiroy@kernel.org>
 <CAK7LNATtOzj175_Y0qQz338FRG1GYCrsorA=jWG+Go1Wjn9rnw@mail.gmail.com> <8795e8da-981a-4876-99fe-8a4edb2185bf@linux.dev>
In-Reply-To: <8795e8da-981a-4876-99fe-8a4edb2185bf@linux.dev>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 1 Sep 2024 15:50:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQfpge7Hg8+yq3uyWD26D=kMcB3pKuoN+BGLfrOFFNgLA@mail.gmail.com>
Message-ID: <CAK7LNAQfpge7Hg8+yq3uyWD26D=kMcB3pKuoN+BGLfrOFFNgLA@mail.gmail.com>
Subject: Re: [PATCH] ARC: update the help message for CONFIG_ARC_BUILTIN_DTB_NAME
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240831_235111_759398_16E7598B 
X-CRM114-Status: GOOD (  12.02  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBTZXAgMSwgMjAyNCBhdCA4OjAy4oCvQU0gVmluZWV0IEd1cHRhIDx2aW5lZXQuZ3Vw
dGFAbGludXguZGV2PiB3cm90ZToKPgo+Cj4KPiBPbiA4LzMxLzI0IDAzOjEzLCBNYXNhaGlybyBZ
YW1hZGEgd3JvdGU6Cj4gPiBPbiBTYXQsIEF1ZyAzMSwgMjAyNCBhdCA3OjEw4oCvUE0gTWFzYWhp
cm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4gQ29tbWl0IGFiZTEx
ZGRlYTFkNyAoIkFSQzogW3BsYXQtYXJjZnBnYV06IEVuYWJsaW5nIERldmljZVRyZWUgZm9yCj4g
Pj4gQW5nZWw0IGJvYXJkIikgY2hhbmdlZCB0aGUgZGVmYXVsdCBidWlsdC1pbiBEVEIgZnJvbSAi
c2tlbGV0b24iIHRvCj4gPj4gImFuZ2VsNCIuCj4gPj4KPiA+PiBDb21taXQgZmQxNTU3OTIzYjJl
ICgiQVJDOiBbcGxhdF9hcmNmcGdhXS0+W3BsYXRfc2ltXSIpIGNoYW5nZWQgaXQKPiA+PiBmcm9t
ICJhbmdlbDQiIHRvICJuc2ltXzcwIi4KPiA+Cj4gPiBBIHR5cG8uCj4gPgo+ID4gIC4uLiB0byAi
bnNpbV83MDAiLgo+ID4KPiA+Cj4gPj4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDxt
YXNhaGlyb3lAa2VybmVsLm9yZz4KPgo+IEFja2VkLWJ5OiBWaW5lZXQgR3VwdGEgPHZndXB0YUBr
ZXJuZWwub3JnPgoKCldpbGwgeW91IHBpY2sgaXQgdXAsIG9yIHNoYWxsIEkgZG8gaXQ/CgoKCgoK
LS0gCkJlc3QgUmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51
eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
