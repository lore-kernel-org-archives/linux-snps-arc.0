Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE9AC7EE24
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 May 2023 09:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nm7HAXIM532/o6Ip+Lxe98LSaJBt8rre3O6au+1Acos=; b=yaSgqtfX/09VAF
	4DyI5jrXQ8ZrECgIDQIaz358uEhQjJTomA09IMt+kRibt2ZgGvbyJLiohrE6xlgmpbNvhHm+59gy2
	yUuaJ1z74XE01nzmu71PjRWBWfGdnK8acE7CQaekMjM7G+1VkPape5nR/oVDXDW8uyn5HYD8Aywks
	7OAK0Q2+kfqyMFjsy1syopJM2pjYyr3cmaL3IIHGnKuN5m+Z5cFw7iJt3jiep0a2uPcKwMa1XQsSj
	s7Ck/oAmOAjjscQUtMlFn8VeTZwW+uzdKfG1URbwfKpGA5fKKrRkvLpkLKK3erGmHB0FSpvFRzVbm
	S9mPQwi77hLFHN5ZfYqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyqpf-00524D-0n;
	Tue, 16 May 2023 09:18:59 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyqpd-00522j-0s
	for linux-snps-arc@lists.infradead.org;
	Tue, 16 May 2023 09:18:58 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-559e317eef1so196443747b3.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 16 May 2023 02:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684228735; x=1686820735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3PO2Pyp97ZMAD2vBcdWWuGlS8wMmQ0Anr89fdT1itg=;
        b=SnLc7z4OusgQkdLJW2gpC1baRzLHCxxry6/C+4UjVFNnTPasnfiPkwK53P1kkgTVdD
         jTKK8ss4OZD8XKjjQq8wY03VJ5Oe5RHDs1yvY8+EOTxoWcJSuTK7C11kpIWmw3gXQJHd
         Lr1Q3yVH/sbUISDc/hPO6XN45n3T4qV7q9AbqbvoF3TF/CKKfgqucw7C9ikJ60JvtEYM
         RZWq8qHyla87xTV8v+o/RkUfgaKOxVyUC2q+zgx1kDfIfEhVq+nmpO3H61poEs9vdGUc
         mOzQj6BxLBs2pa6WpFCON0vyVIFD01vnG8CwRDr7oaC2ucRGNIWDDeoHyor0/J84BNNJ
         GWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684228735; x=1686820735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3PO2Pyp97ZMAD2vBcdWWuGlS8wMmQ0Anr89fdT1itg=;
        b=btuvbBrWs9uyLGF+BEfE3/oRAmg2EPplD+UHQGW8pY+5XLg5ktqQidmt7C/P5DvALP
         D3jlArFjAJsxCWboDkyA67lt/hjYvh37pSSD3E9av0PCv6UjfYpuE/lUdZWbPnBdcEfj
         5GwEQiVUPAmTeM90ZQFixl2QZF4mHjLLqeD/ajEcTaPghPv2CIVhvNc6hHdXTUaVs0Hx
         ErJ2EeUfi0mF+rGUrW3Bh2e4nbd4KLEsgsGVPOuiM9LGzHZSQ0SFXWSOqZngqAh2ysQD
         ZmkCsTPpuIa9Y56+2NHyrOX3i01Pd+GPCQ5zb6BEb0Yn8lwvpVoga7FAdQfpMS17J7K7
         sx3A==
X-Gm-Message-State: AC+VfDyW2wqP6vbiApkgJRDutWDlpoLtcYa1zjJmw+AbrM/cQ+VZdnPA
	Np6j2P/C29Siw0HVTrJNNHqtQ1o4o7klCEloABKh+w==
X-Google-Smtp-Source: ACHHUZ7ouX4pR8enSVuqce0U0lt0Y3WNzSweQexHvE3MJ4CinODJS3Gxe6HEZ3NipwDnbhl+pti8r/LzgvUfPj6ua34=
X-Received: by 2002:a0d:c701:0:b0:556:d4ab:cbe with SMTP id
 j1-20020a0dc701000000b00556d4ab0cbemr34265656ywd.39.1684228735569; Tue, 16
 May 2023 02:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org>
 <20230503-virt-to-pfn-v6-4-rc1-v1-2-6c4698dcf9c8@linaro.org>
 <CAMuHMdVJjjo9TMeow1-i27ybpQOu9-VZYnTkY5p8p_Cm6sW_GA@mail.gmail.com> <CAMuHMdV5Aukxx+XyC-s2=CDa2BYqvc3uRvWBhD6ri5j09tXj3A@mail.gmail.com>
In-Reply-To: <CAMuHMdV5Aukxx+XyC-s2=CDa2BYqvc3uRvWBhD6ri5j09tXj3A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 May 2023 11:18:43 +0200
Message-ID: <CACRpkdbwd6ELhJVu--=N+Ckjp0MNyG3aWv5B+DQUoXNVFicDfw@mail.gmail.com>
Subject: Re: [PATCH 02/12] m68k: Pass a pointer to virt_to_pfn() virt_to_page()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vineet Gupta <vgupta@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Greg Ungerer <gerg@linux-m68k.org>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-snps-arc@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_021857_314698_3744B636 
X-CRM114-Status: UNSURE (   8.11  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXkgMTIsIDIwMjMgYXQgMTI6MjbigK9QTSBHZWVydCBVeXR0ZXJob2V2ZW4KPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKCj4gTXVjaCBzaW1wbGVyIHRvIGRyb3AgdGhlIGNh
c3QgaW4gX19wdGVfcGFnZSgpIGluc3RlYWQ6Cj4KPiBAQCAtOTEsNyArOTEsNyBAQCBzdGF0aWMg
aW5saW5lIHB0ZV90IHB0ZV9tb2RpZnkocHRlX3QgcHRlLCBwZ3Byb3RfdCBuZXdwcm90KQo+ICAj
ZGVmaW5lIHBtZF9zZXQocG1kcCxwdGVwKSBkbyB7fSB3aGlsZSAoMCkKPgo+ICAjZGVmaW5lIF9f
cHRlX3BhZ2UocHRlKSBcCj4gLSgodW5zaWduZWQgbG9uZykgX192YSAoKHB0ZV92YWwgKHB0ZSkg
JiBTVU4zX1BBR0VfUEdOVU1fTUFTSykgPDwgUEFHRV9TSElGVCkpCj4gKyAgICAgICAgKF9fdmEg
KChwdGVfdmFsIChwdGUpICYgU1VOM19QQUdFX1BHTlVNX01BU0spIDw8IFBBR0VfU0hJRlQpKQoK
VGhhbmtzLCBmb2xkZWQgdGhpcyBpbnRvIHRoZSBwYXRjaCEKCllvdXJzLApMaW51cyBXYWxsZWlq
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1z
bnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJj
Cg==
