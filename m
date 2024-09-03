Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA63CD379F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Sep 2024 17:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKRgE3psfhYUINZexnIbgFXo7/gNaA9bH5sfSbd9vds=; b=tPv3uczA93z/P7
	Xvrd0RzGt/X3jxu/YhpcKJtlEq8l4aZYFFoQ5Ixnj7gaF9U1nismLXhu9zhFTwLMWxCLSIDfH2ZCY
	kpvrARMEG5kEmpa9c3cD9JzNja5eWB3dJZvTE3nXakXOKNobiWk+LhU7p7fjevtsLYLL0Cz8Ht4nq
	JGc47/5BOxYmaJhIs1S4DDM3meRgEOk3worWHFlsxkl9AjvEwb/Yac4NdVhRGQG+o9RsbPDvpdpvx
	CoUMvpADRMKlTdV7HG6R6Sw7zOfiTLtAO620PrsqmLc4zlHPBpgdQMa+AV1+SQQ9Kt9FGD2uzrtjy
	LVVvN4JEG5A5nuTKAh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slWyQ-00000001El5-1gXL;
	Tue, 03 Sep 2024 17:05:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slWyN-00000001Ek2-0y6Z
	for linux-snps-arc@lists.infradead.org;
	Tue, 03 Sep 2024 17:05:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3671A43CCD
	for <linux-snps-arc@lists.infradead.org>; Tue,  3 Sep 2024 17:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9CBC4CEC4
	for <linux-snps-arc@lists.infradead.org>; Tue,  3 Sep 2024 17:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725383141;
	bh=KDEMp+pzqqkgH9YNk/FQO0UlQZO0u4LjtiQ4Csd25gE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QZuwgsKpnjB39latEAEszX9u3W1MZtB59J848U7j9NWUACnjRnDb6fv+GAwarNe+J
	 Z5pLiFaaufBkhKnXokjcIrHHEiow5dFjSSO/RMofqYtNHKieoiHpzAtk/YYgUY7kqn
	 B45y/jqzze8pkRLPfyENUx9QLTxEemBrbH7tYHzC5/FPiBc1f/UvR50KBmLzhqrIix
	 ETpZfOKJT+T7P3ASvnb0GGasiGcp6S4V78Th4QPGKHwWjdWMc1fYQj2vTmjlUsW8uT
	 5m+W8zMRUPkVo6jVzdeN2PQdEm2esfi+Kne9G4Y0ZEu8Wa7QWAnHRh5qkL3XKAlbrI
	 LcUhttytRKBdw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f3f25a1713so67038351fa.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 03 Sep 2024 10:05:41 -0700 (PDT)
X-Gm-Message-State: AOJu0YwPPmreUIEGEhrvrHu5up/n7y0uGh9Y/ALaIPtVTCmUjHPAgRpM
	76VP1doiIuh+Gnxj5aOGMH3G3ojXeuJXZ25gBInPGBFMcEbkEjo6cv0gtz8ZRpSJKdweFEEY1LT
	ZH0zFBv9rgJGYuZ/eC+j6fa48kyE=
X-Google-Smtp-Source: AGHT+IGZ5lQbHCzKN6XXvCQw+Y4PHBxvxxgEyUDbL3iSgHhKX8qsiaG0VzN46xsqAPEaQ05hU8wcRbkvwVycLSz0DFA=
X-Received: by 2002:a2e:b887:0:b0:2f4:fc1c:e5dc with SMTP id
 38308e7fff4ca-2f6265d771bmr94290551fa.33.1725383140316; Tue, 03 Sep 2024
 10:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240831101045.1381258-1-masahiroy@kernel.org>
 <CAK7LNATtOzj175_Y0qQz338FRG1GYCrsorA=jWG+Go1Wjn9rnw@mail.gmail.com>
 <8795e8da-981a-4876-99fe-8a4edb2185bf@linux.dev> <CAK7LNAQfpge7Hg8+yq3uyWD26D=kMcB3pKuoN+BGLfrOFFNgLA@mail.gmail.com>
 <e72b55f5-2e12-43b1-8f9e-ddd7c9db8246@kernel.org>
In-Reply-To: <e72b55f5-2e12-43b1-8f9e-ddd7c9db8246@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 4 Sep 2024 02:05:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNATFVFMTToJ-xWoKsj-LkqocHX-p86aEsHsB5mDHrsYgXQ@mail.gmail.com>
Message-ID: <CAK7LNATFVFMTToJ-xWoKsj-LkqocHX-p86aEsHsB5mDHrsYgXQ@mail.gmail.com>
Subject: Re: [PATCH] ARC: update the help message for CONFIG_ARC_BUILTIN_DTB_NAME
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_100543_357039_93D4480C 
X-CRM114-Status: GOOD (  14.99  )
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

T24gVHVlLCBTZXAgMywgMjAyNCBhdCA5OjM54oCvQU0gVmluZWV0IEd1cHRhIDx2Z3VwdGFAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPgo+Cj4gT24gOC8zMS8yNCAyMzo1MCwgTWFzYWhpcm8gWWFtYWRh
IHdyb3RlOgo+ID4gT24gU3VuLCBTZXAgMSwgMjAyNCBhdCA4OjAy4oCvQU0gVmluZWV0IEd1cHRh
IDx2aW5lZXQuZ3VwdGFAbGludXguZGV2PiB3cm90ZToKPiA+Pgo+ID4+Cj4gPj4gT24gOC8zMS8y
NCAwMzoxMywgTWFzYWhpcm8gWWFtYWRhIHdyb3RlOgo+ID4+PiBPbiBTYXQsIEF1ZyAzMSwgMjAy
NCBhdCA3OjEw4oCvUE0gTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPj4+PiBDb21taXQgYWJlMTFkZGVhMWQ3ICgiQVJDOiBbcGxhdC1hcmNmcGdhXTogRW5h
YmxpbmcgRGV2aWNlVHJlZSBmb3IKPiA+Pj4+IEFuZ2VsNCBib2FyZCIpIGNoYW5nZWQgdGhlIGRl
ZmF1bHQgYnVpbHQtaW4gRFRCIGZyb20gInNrZWxldG9uIiB0bwo+ID4+Pj4gImFuZ2VsNCIuCj4g
Pj4+Pgo+ID4+Pj4gQ29tbWl0IGZkMTU1NzkyM2IyZSAoIkFSQzogW3BsYXRfYXJjZnBnYV0tPltw
bGF0X3NpbV0iKSBjaGFuZ2VkIGl0Cj4gPj4+PiBmcm9tICJhbmdlbDQiIHRvICJuc2ltXzcwIi4K
PiA+Pj4gQSB0eXBvLgo+ID4+Pgo+ID4+PiAgLi4uIHRvICJuc2ltXzcwMCIuCj4gPj4+Cj4gPj4+
Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwu
b3JnPgo+ID4+IEFja2VkLWJ5OiBWaW5lZXQgR3VwdGEgPHZndXB0YUBrZXJuZWwub3JnPgo+ID4K
PiA+IFdpbGwgeW91IHBpY2sgaXQgdXAsIG9yIHNoYWxsIEkgZG8gaXQ/Cj4KPiBJIGRvbid0IGhh
dmUgYW55dGhpbmcgbWFqb3IgaW4gbXkgcXVldWUsIHNvIHBsZWFzZSB0YWtlIGl0Lgo+Cj4gVGh4
LAo+IC1WaW5lZXQKCgpBcHBsaWVkIHRvIGxpbnV4LWtidWlsZC4gVGhhbmtzCgoKLS0gCkJlc3Qg
UmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFy
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtc25wcy1hcmMK
