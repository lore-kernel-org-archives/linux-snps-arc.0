Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01E9F3D614
	for <linux-snps-arc@archiver.kernel.org>; Sun, 29 Mar 2026 17:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IUqS+1BwE3Rjh4IenNuyTMdlWFKZTNzwcZ21DjchWhk=; b=wBkVNFzaJN2XpG
	iuIkttzZoeH2TiEHmSo9biiPZlaqBHqxfAIpTLNZzKlSFpEGV6KUiR8YrJphPo+XD9kJMVfPYfJcV
	hilOrVDUGLWoKDFK6UqqmnnzG9b9Z/1vLLsqnUMaL/pJKGwW9PTua+Ln5oTzPddhYkUSb2xw8sYpt
	nc+38a9gTZHw74u7hpVEOST469QBODWlmge3ebVkqOX57RPfgLhMWtEG+jgfui2QFY+oMuVsc+1Qy
	hpGMUvQL3giGv/RC4D8foysV32cKTb3YiysSs1angRyvtm5aFoBYkxMrecoGFUNhyIlzzPp4BopbF
	qTfqI4DYiHZB6h5s1GcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6trz-0000000ACPd-2xIA;
	Sun, 29 Mar 2026 17:24:15 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6trx-0000000ACP8-0hfv
	for linux-snps-arc@lists.infradead.org;
	Sun, 29 Mar 2026 17:24:14 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so2465034f8f.3
        for <linux-snps-arc@lists.infradead.org>; Sun, 29 Mar 2026 10:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774805050; cv=none;
        d=google.com; s=arc-20240605;
        b=O64R/E0yLG8RLwvwVt7mNE5lLMxG9/plHsW8LhlBRqrbE7qezw+Pl45EMWGpZjnTnv
         reQa6MLF9mAkBml9lheeBLw57Cbqg10zzEnLrZf6YxAaoOyumQjNDPudpTjlZr2SXvWm
         E+7rtZJeHR6xNqJwRiP5T+McdXKdfl3G2Fh7LV7BYgfhw7Hgm9sggWu46eJS8wzSr7uf
         DJBKg/LuBorsLRhG1UdXIRaj4jEx26e7PlUeMB29QTSkVqhA6hhnd5DrmckNXUInRTb5
         CVFCgcmpcnAV658YMs6z3UiE5UP1dWpEz7AwAwCfVWtkkhpTldZQHF6KtOcVnkJwZP6I
         imGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nsNcM0DY0GbrHfIl8bqyLDrxI4+ZyqV/0MjDIthQBQQ=;
        fh=4Xf8QCtHoQFlrVjf61iM92tZJGL0i0xXfXY8V4f98WU=;
        b=Q5eJxuvIieIASePm2O0A6RX2siumEO7KG3raGtfxcGdHMQgI/rhDas373GoV/N73Xk
         hyLv7pGMyLoBjoZi3wBtQ3g0GICUuMN9Ze5QUiKFVc+5uQrzKWVd1sqhn5Dm2Bggd/Pz
         yOsvOZouXKEYyLL33uvIKkfHRVdc6pLGYDhSYYJ5Ur6Tlqs2Z83R2yJ80sf9kziPQL5t
         a2VrStRypsqu1lwjbye+VT866yQPyxbzKYXv5n1pVOKzrRFGfKiFToGzjotHljEK3mrU
         +4vG26NUllcFYjAKIKK4a01Lxcaz3vCX/6fqmHGrh7jZ81lrXvWIt73/9jg1XQrMTd3/
         XJYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774805050; x=1775409850; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsNcM0DY0GbrHfIl8bqyLDrxI4+ZyqV/0MjDIthQBQQ=;
        b=fsqLoDbcluRWrKJpgN7Bt8dX8auhKdoPlnq47zaOm3Vk8qECFN+3N6L9mmkryKYQA/
         nuzBH4g+kvSQhHjtg8JY+ARLUKNW1puoxsR62WtvekFw8ZF/yetAW0T+vRFkkzEP2CjL
         I+LSkiu1RXkhDhAAmxv01Y4W5giKeFT1RbPf46weYIiyM2hWWb14IDnpQ1PyBfqkKEvs
         fr/1ORttrBSlfBRaqkEFTKVXh9uIAYkhqWafeM90P2f5mGDHQcylRW5A4cMWWuoc966A
         81p7K5jO1DDtQgSe5iAAqQ8mYvezxPCSuD4+G7cr0vRQCcSiCJobcp9OCF3y6o2EvVbv
         Ezvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774805050; x=1775409850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nsNcM0DY0GbrHfIl8bqyLDrxI4+ZyqV/0MjDIthQBQQ=;
        b=XBe49WZgkZBG2sYeoc2qcKBT/AUOM5QEx+G5Qn8B9kRrqKpuorK4JthXBa3QL46e/2
         Jt/bEGvuGbAA0hbyXrI7gocyvdFw1mFMxehsOATWQqeCRwxtebSKVkZvBBdr7QQgGI7i
         B6MzwPFbegAGwsemeXhmChRu9efHEhZYEhtUP7NMtNHSfOvZktyg8L05kwKpvV5EVZTO
         LWHjqFdulp2QghBQT1teh31AlxHwKaTan4KA4DjPMAhrYUmaQQYSOzXSbLtD63CSdgNU
         rRKCgrlQ8/BkQS94JrfU2TPIivcmbTAcuGdCHwXGWdprsGmp6F8EsJZkPEgeysO4+NTJ
         NtVA==
X-Forwarded-Encrypted: i=1; AJvYcCXQLvnM3wdsvsM+A4mdmEEtj5sOIP3G17kPj8I8LWda1xn+Jv2z1j6eBtSMsXw+OGWHC8lcLCEP9aPZrXzw/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5O2Dv5z0TInpI3DdxDqIJiTt0CwbHvdo0+YwcjpvwzemJcgNi
	LJE5sfqjxfanGmbojW93fAbHVqgjNhigqTNRfK83/cmrGIr4Xzm8/qBYMQC4zi4tuaycufpXotm
	V5eMVEVieaRC/4sEqQ1Ojqt8ACI1vDEM=
X-Gm-Gg: ATEYQzwCFoJrSiF9QEamZFILdBwWdJfgHPEo5l6PkvsI8rNa/xbNQwAmBWC8MYajDgf
	rNDckGqdBlc5mDqPXbhdya+AVA9nZcp8ouA1jQNUL2e2s9d90vaJBi3eyl7QOczS7gxZYUtJgeK
	fOoiLoHlmbeqiKg4FcvHwMErveKuwrnV9+mrv/mN6DSJigg11C2cKmFzPa/bkuY8OOK8Yfk7AnR
	MDUn28KBI8ugREgb7Y323jKatPOuL7W0LtvqhOt/zYgM2Jcf0yB2bpA6jZGlPJKxWzuYnJujAwM
	yU17ZGPD1ZfmPYu0iGg2UNCTnDS/41mFOF5VQxcyO6Mut+Kw3dwp2xpLn7EQvT5pagUL3BnMOBF
	EqXmmcHdT5joWSXPQjezhKQ7ZoA==
X-Received: by 2002:a5d:5f90:0:b0:43c:fdd9:1890 with SMTP id
 ffacd0b85a97d-43cfdd91a7cmr2742839f8f.51.1774805050213; Sun, 29 Mar 2026
 10:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260324122703.641-1-hechushiguitu666@gmail.com>
In-Reply-To: <20260324122703.641-1-hechushiguitu666@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 29 Mar 2026 10:23:59 -0700
X-Gm-Features: AQROBzBTRgi-yNiUamK3PL6ZySeng2gSnp7g-HgSIPKYBlYukOHbRkVG543ZXJA
Message-ID: <CAADnVQJF70sBuaJsXW+=1cR3wTQEq9zRLG3jrvg7A5+Xqiw74Q@mail.gmail.com>
Subject: Re: [PATCH] arch/arc: bpf_jit: fix missing newline in pr_err messages
To: Haoyu Lu <hechushiguitu666@gmail.com>
Cc: arc@lists.infradead.org, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, 
	linux-snps-arc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_102413_223516_6B69EE08 
X-CRM114-Status: UNSURE (   6.99  )
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

T24gVHVlLCBNYXIgMjQsIDIwMjYgYXQgNToyOOKAr0FNIEhhb3l1IEx1IDxoZWNodXNoaWd1aXR1
NjY2QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBoYW95dS5sdSA8aGVjaHVzaGlndWl0dTY2
NkBnbWFpbC5jb20+Cj4KPiBBZGQgbWlzc2luZyBuZXdsaW5lIHRvIHByX2VyciBtZXNzYWdlcyBp
biBhcmNoL2FyYy9uZXQvYnBmX2ppdF9hcmN2Mi5jLgo+Cj4gRml4ZXM6IGYxMjI2NjhkZGNjZSAo
IkFSQzogQWRkIGVCUEYgSklUIHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IGhhb3l1Lmx1IDxo
ZWNodXNoaWd1aXR1NjY2QGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gYnBmLW5leHQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1h
aWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
