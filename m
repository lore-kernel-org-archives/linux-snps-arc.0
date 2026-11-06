Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362B9606A326
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Nov 2026 08:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KMGeBoWl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wj1o9GQEiHtfdX5XocR+pCUsA4h/bd2+Yuq+TN+op5c=; b=KMGeBoWlgaZnjfiD+PMQueUSUb
	WpNhi9YPqCQqJsJlXP9tbKMCOJPi9yc0p69gfNn5Mp4uV19u7U6hSKpG7xYuJcu0M6vsXnOZWclbF
	3UlpeXnNo4VKRyl6TOpuqxBSKYwcXbPBV08njGAkaNvky4zz4PBoSbn+smiyS1zHRxQjQzTSi7x48
	23mJ9XWvSNgkBEK/FodNpmL+velEDKApyiTETms49sAIArdPi4Btbm6wKPCzn0vfKnXNM5le9pBSp
	R92HCc5zsNLnMtMmrMj/9Nj5lx7Jg+wlI0ZwsD3P+QMzfVGwIB34kUMKqghS61wri04M2f/H7g0aK
	/lwkqiYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEvv-0000000BWF4-3kt9;
	Fri, 06 Nov 2026 08:04:23 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEvi-0000000BWDm-0Spo;
	Fri, 06 Nov 2026 08:04:10 +0000
Date: Fri, 6 Nov 2026 00:04:10 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Bence Csokas <bence.csokas@arm.com>
Cc: Chengchang Tang <tangchengchang@huawei.com>, Junxian Huang <huangjunxian6@hisilicon.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Miri Korenblit <miriam.rachel.korenblit@intel.com>, Jes Sorensen <Jes.Sorensen@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>, Johannes Berg <johannes@sipsolutions.net>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, =?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Vineet Gupta <vgupta@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp Stanner <phasta@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Zack Rusin <zack.rusin@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Selvin Xavier <selvin.xavier@broadcom.com>, Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Paulo Alcantara <pc@manguebit.org>, Namjae Jeon <linkinjeon@kernel.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>, Carlos Maiolino <cem@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>, David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, "Geoffrey D. Bennett" <g@b4.vu>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, linux-security-module@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, chrome-platform@lists.linux.dev, linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-xfs@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/3] Add offsetofp() and offsetofendp() for pointer
 arithmetic
Message-ID: <au2J-lMcEn4p4KGR@infradead.org>
References: <20261105-offsetof-v1-0-4153f5c10edc@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261105-offsetof-v1-0-4153f5c10edc@arm.com>
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 06:16:15PM +0100, Bence Csokas wrote:
> A common usage pattern for offsetof() is the following:
> 
>   offsetof(typeof(*ptr), member)
> 
> Condense this operation to one macro for a more maintainable code base.

What exactly makes non-standard macros with no obvious safety benefit
more maintainable?


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
