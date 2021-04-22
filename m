Return-Path: <SRS0=6Q4T=JT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9D1C433B4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Apr 2021 15:12:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D813D61077
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Apr 2021 15:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D813D61077
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=arwwJ4xvmXWDydlX3iVW9SHJqk8+wF1RU5zgSd9FSqI=; b=iu9/LNk4Yk2DCzYNN4NgLowUK
	xYUHt8B1nFspgwQIDELZ8U0CKcZL2b1pE9Y5h90wZE1Kpy1WlQ2BZo72oZOSqMMTEwaL8lbqSCOjd
	qBHoegcC07XZD0xuSDQFfz+4TiXSMWoxhmY+YMWiSS1r23YPE6hGk8oooTdY9eMI2lp20W0wUxL1h
	JZIx56Xuew0m22uOEoKpjDpS0NDjZb5uc/KznRXHmmkigAqqNuU1CRyfvFWQy6MMEskKJUmGSsEeL
	iUUxM6D5YHV7aMVKt3T0Myga3iCKoKUejCixe/2zzD3BaokKbkCgrSAV0ugrYuin4v/wKrPEwpKsB
	rsF5l+IjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZb0X-00GweR-Je; Thu, 22 Apr 2021 15:12:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZb0V-00GweC-9z
 for linux-snps-arc@desiato.infradead.org; Thu, 22 Apr 2021 15:12:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Description;
 bh=R5SbOIZge6g0GGc04IqUh0dqr6Q2dn8ooVuDNvHU5cM=; b=KHyO6slA7J2z1fWCLWYYUxST+M
 8k9iy9vVrPPgrpIAhq41gEBlW0YdHPmRi1LGeG5B4Yh0CRMsxZCVLoFEFE2zC5T1Q6C92q5YwLvw/
 wv0hV+XfPyrZUXLTyUW9Ciq2WWtM20JRBsMkV9luyQfLiVfxBEHxA358WKhGyQdhsnA972saKr1nG
 Psgr3SQ/IRtStKoEIIIHq1Mn14njlS7sIXahV/d2FT4Upx0KBMvTUDBvBOW264e+wzqRSbDypPLFf
 pYZTc9JnGatMdGK/ZmxGaf3DqXekcG4rm9Qa4vVfrzk4G+vziclr9iuFLULNhQmOs4ZB97hZ+/sz3
 bbgzgn2w==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZb0R-00Dmf0-En
 for linux-snps-arc@lists.infradead.org; Thu, 22 Apr 2021 15:12:41 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 46D1E405C4;
 Thu, 22 Apr 2021 15:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1619104357; bh=R5SbOIZge6g0GGc04IqUh0dqr6Q2dn8ooVuDNvHU5cM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=TeOTT7FmKts7L/t/x3FrkABSlu2yFsA4V8c1wICp4l/Gh9HRV4Rm9gA5r4TfgI0ir
 0+KD+HuIhaBxBY6F6PqW9mJbhwwDXI0BYtAFmYKlGVNDNfE3zsMHU3IgN7nrHgVY3p
 N8pZKNuj/o0gFi5WqAurMQqqMyPZrYmt5hK6r/IHAkSq59P5/3kX+vakrSa0P4yTfr
 4SBphdjln81V9g4Cl87DPe3t5qe6s8sQqFK3e8mP9kQu2z+afujGJ24f2tqozq1hed
 HYNBBActBN7+ty3lJ6qZUM+0vnQ82VX1fOJnnTEiUHhrbWiEFkOwkEbsM9wx7xVnQD
 NO1vIRuJP65Yw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id EBD09A006A;
 Thu, 22 Apr 2021 15:12:35 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0DE72400DF;
 Thu, 22 Apr 2021 15:12:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="JPVQJONG";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3PPnaAyZjSlMIIlY9OvVJovuz5Zt4ihStDHjMNCjQyMaZwq58CQPjJrK+ToMpqxIMHYnrxJIbNv0Cif2m2reb8zWZqwAQ2cHbyKDEZFLcbPYMLu5HT/wWW/KYuMWmJMJWhyPUEpe0+ZjnP9ZYkitYNZdiLYbBZb0QKPhxw4zkKnGsJ3GwXkG4+Di+BMqjOsXxT0rbkr7nMcyzF5xvX7PKGkH4fDSaq/LIN9POLVN+kD3+/ZWGTw77nLbwVCEcW1p7wFdm0IT8Lz/pKfSZSYMAE1H5dSMI0a6WP/13hosJiBCKuU/AMrL6KHjd0P2qm5NmfHoLrJjHc5snf+qBrVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5SbOIZge6g0GGc04IqUh0dqr6Q2dn8ooVuDNvHU5cM=;
 b=F2avqNVQzvOJP97AvXUKX0IAg3L3F3AUNj3DU7XkbodyWo1GalLovSEYARzTI5GDRZ8c5iAs1/Tqqyhr8Z9ZS2WQkAto/nNajqGXQqXDb+7qT6pM8HJ/5haxzo6ZwrE5njOFONA988kLCclc4F6ki8uvYQim4Dgdeea3qBsVYRxhiOFBndrjDmNsTSrWDCWjklNNKPmPgvNIVfvHc8Ft01LGza/UQzAUcvbknf7CND9iJdATQoqH2o45vw56N681WWX3JEDWfGPMJLrU8GfKJl0kUdRY2uskA7wa3ITdulQc7ZZxsrwxZni0d3dls0/ghe4JbSSm3H25e8wGlw95cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5SbOIZge6g0GGc04IqUh0dqr6Q2dn8ooVuDNvHU5cM=;
 b=JPVQJONG9SHpqKparhVl5GlOTzk5nNeECvj2ZNLb3gU9AGLqJTf3kFFloDWnhJw0vBgnv006aiXnYYlFi4TOZoCxVw3r6406fT3tE43M1YKfLBR7xvYMTPH8jNZm+g9RwVJAaTysgqlznfx1txLHBsUzyg2gUgIhEfciP87jjpQ=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2807.namprd12.prod.outlook.com (2603:10b6:a03:6d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.24; Thu, 22 Apr
 2021 15:12:32 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 15:12:31 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] ARC: kgdb: add 'fallthrough' to prevent a warning
Thread-Topic: [PATCH] ARC: kgdb: add 'fallthrough' to prevent a warning
Thread-Index: AQHXNzbQMAEXJNE8uUO24SKkuH/8larApWaA
Date: Thu, 22 Apr 2021 15:12:31 +0000
Message-ID: <8be12bbb-5bff-6689-d903-8943776af883@synopsys.com>
References: <20210422051653.23078-1-rdunlap@infradead.org>
In-Reply-To: <20210422051653.23078-1-rdunlap@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org; dmarc=none action=none header.from=synopsys.com; 
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 139b42fd-34ca-4384-8e59-08d905a10d3f
x-ms-traffictypediagnostic: BYAPR12MB2807:
x-microsoft-antispam-prvs: <BYAPR12MB28076D12ED04ED0476623C45B6469@BYAPR12MB2807.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u8WM/0/lh2H/5tv8pJdUGinFpSgtBiOX6yWvcgzV0prnYu7Txwc4e3j4ve/KqiKA8B1HxWubMSxrXJmyhOuK+HWfk31jHYn2lu29NhPx1YMhtJOyqkH6M/luznLm+xeH7pbMQwGp912O0ZjNJ/ZYmcQBhdUGoyHnsVTTRhnVyiMuqQ33JDDdHteSn2Xwv0WuS/9o/+lP/DqZoZN+10p/pAT2Wd/hCxxr53bbq0Dcv5ohcEPOOlN8rtx1aDpdyTJuTKGtNo/g1YIQY3a6Wo6GRgE/raqceF/WkZeEC548wi7aIsMbh43wD49qMpBqU7fgxZN5UuR0hTPXZwAvvVcDXHNjMVIr4B+Qf1EZw+9GrOHKBT/QIBnZMlMr7/RSXJmo/Oum39c0awt/RrHBh92xLgnvDZdm9X1IE/Bz9ZKYE47vqfLIjf6RP/Y9p8w8t24AKkPTSU+/2WPXCmWSJ3VdTDR8pg1gzFdDu1p6QmELGzEDJqmUJD5ZBO6yOlOayxmXHzPjt+dPKv2MsR/53qRY8fr9l+UZmWtd+5l+ZYHgNAsVgY4CQWNet2JPdoeBQDi0RF3ejMDDQVSKgQDtXj78ztolOYqJ5T1VIdd+EDPmZ+OE2G0xiIKXO9AGud913VShXYt3DKGwbrRhdeqiy9iPVNtb1NhtASRBHBBNALW8GTI+4REvNkTXOeD+sL2KIzbK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(4744005)(83380400001)(316002)(6512007)(36756003)(8676002)(4326008)(66476007)(66556008)(86362001)(53546011)(71200400001)(2906002)(8936002)(76116006)(122000001)(64756008)(6486002)(478600001)(2616005)(6506007)(26005)(110136005)(31696002)(66946007)(5660300002)(38100700002)(66446008)(31686004)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?elB5RHkrZG1kMU1QYnVTa2hOOTh2MGhic2ZOUldTZzYyZmxYV0RYSnk1S1hz?=
 =?utf-8?B?NU5SbjFTbjdCTW15Q2hQSlhXdXBSK2Q3QlpINkhVTTZ6VituU01EOE00a29N?=
 =?utf-8?B?UnNLNmV4OGxrbUxuSkF6bUdCSUZ6TEJmcGhkRUZrVkcxVEtmR1RHMVkyNEpN?=
 =?utf-8?B?dVFJZFZ3RFNVQmtUOTF3TGxiZ3QwL3AxVXNWQmQyKzRSc1pBeXRmOFJzRmx0?=
 =?utf-8?B?NXBHZEE5TmRWNmgwWkhHc2VtZUlRRFZDcmZ1RTl3MzVldTN2dWk5NjNadVgx?=
 =?utf-8?B?aXVOc2JaSGNudXFkYXBUSWhWRUI4bFB3TUNCbGFSVkI2ZGxZS0hDZGtRUlJN?=
 =?utf-8?B?ZFFsVHFKdU5wM1pGR0YwZ3FiUTlaMHVtbW8yT2ZjcmFFL1h0NXFldm8xbDFy?=
 =?utf-8?B?SmRvczhlc2g3TE5JVkRSeXhwcXptMThyQkhRdW9jMGtmSTRyWmN3Yk9wbjla?=
 =?utf-8?B?ZlhhdEE2di9QVTgvRHYydGJuM0pJbTZjVXo0QUk2TXF4ai9yRURJUk00eDA0?=
 =?utf-8?B?Q0lxVG9zNDJodHpCZlRpZzZvT0g5N1VTVkE0cjUxR09vc0hBR2VhVTNWakdB?=
 =?utf-8?B?SS8rYVQzZ0syZXM0R1BacnNzMVRoQzUwMEtIczVhWUhEbEZKQUN5U1REeHdT?=
 =?utf-8?B?Znh2ZVplU0NaS0YreXFFWDNqV1N2bXFvWDVnSndNemVJeEc4S2xXeFI4RXJR?=
 =?utf-8?B?cmRtdk5nRmV4ZEZ4TlBjUUx1cTBuZUNuMGUxTzE3Y2UrdlZpNmtoM1g4bmdH?=
 =?utf-8?B?YVplU2pLS3hDT0hVN3VDRDdCRmFvWTU0ZlFhWGFrZjBuMnlLc0FRaDd5Tm5J?=
 =?utf-8?B?TlBoUjVWM29CdUcvanUrVXdLalZudnNjR00xUHFMcFRhR09NVGpISjlDNWJL?=
 =?utf-8?B?dUNmbmo3RERZVnJHMURHQkE0MWRuc0ZlNWVIUVhDWW9oMzQ0eUY0dGs3OENZ?=
 =?utf-8?B?M0FIRXBhdEozMzRLTG51OU9oVVYyMWxBNW9aeDUvWHByY3E5alp3WVk4MS9l?=
 =?utf-8?B?aDduMnoxbEMzR25qV3FnMks5ZzVsdStFM0Jxd2ZGbnh1NXowWGRDTEtjUWc3?=
 =?utf-8?B?QTFSZ0NBbEhWVWZyQnhBb0FhWUhSRDZMeXhkR2xvMHhHSU5SV0ZWMnliWUox?=
 =?utf-8?B?RmhtT1BUcVVuTDZXQzFJNkVobjZGb0NNOXNXVGVHcnNEZ3JqZXhRbnNmUDV5?=
 =?utf-8?B?OVowd3lEbFIrWGh2RzcyTlpOM0QxR0IxQWtwRGkvR0l6djVhbWZCRWZiSUZQ?=
 =?utf-8?B?V1RnVmhST3dPU2xBZzV0My92UGZJWi9PU3RSS3owdVZwZ01ETmVpZU9XKy9r?=
 =?utf-8?B?U2MwZHFpNDhMeDN3Ulg0amYxRE9xaVN4VnVjczdWcm1DTFBiNXliSWlDazFO?=
 =?utf-8?B?cVp2dzFBYW1nbEhEY2VnZS9tbFBUQ1RUb2VBTldYUU5WVHN5dkE4NmxYM3Jw?=
 =?utf-8?B?M1Q0TmcxdGFRdytKUGtBeWZkMXhiRHJWRDg1Vk1YcEdKYTM4SXBQZW4rWWFw?=
 =?utf-8?B?UjkyYTQvVGE0VEZGamVhZ2FtY1ZIc2xGVEJQZlZqcnhHTmdoeEc3SlptVmNE?=
 =?utf-8?B?eFVTNWRLWE1nYXd3cEk1REdDNW5xUVNrY294UExzK1dNYUZ3U0VicCtpTWRQ?=
 =?utf-8?B?dk0xQ3grZzlQR0tZcjQ2d0NDejFVRGZvRHI4UkpBNGNHYVFvRExta3FFOWdt?=
 =?utf-8?B?STRDMnZXVFhQUG5PVzA3ZC85L2lCWmZ6bGpHa2w1Q2dBc3VGZWx1ZFpDSlRr?=
 =?utf-8?Q?s3OhDCI/Emp5ZDBWTg=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <4D66D3FC5078C44BA533615E47A77885@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139b42fd-34ca-4384-8e59-08d905a10d3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2021 15:12:31.9078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4JPQTx753vnqTX6pqXw39/WHeLhi5HuUMbaZpcqiNNlbMTbS5liDcuXVIED2Hc1H593k/0BAKKrOvtjaRyQbfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2807
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_081239_593505_8A781609 
X-CRM114-Status: GOOD (  17.15  )
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

On 4/21/21 10:16 PM, Randy Dunlap wrote:
> Use the 'fallthrough' macro to document that this switch case
> does indeed fall through to the next case.
>
> ../arch/arc/kernel/kgdb.c: In function 'kgdb_arch_handle_exception':
> ../arch/arc/kernel/kgdb.c:141:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    141 |   if (kgdb_hex2long(&ptr, &addr))
>        |      ^
> ../arch/arc/kernel/kgdb.c:144:2: note: here
>    144 |  case 'D':
>        |  ^~~~
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: linux-snps-arc@lists.infradead.org

Thx for the fix Randy. Added to for-curr !

-Vineet

> ---
>   arch/arc/kernel/kgdb.c |    1 +
>   1 file changed, 1 insertion(+)
>
> --- linux-next-20210420.orig/arch/arc/kernel/kgdb.c
> +++ linux-next-20210420/arch/arc/kernel/kgdb.c
> @@ -140,6 +140,7 @@ int kgdb_arch_handle_exception(int e_vec
>   		ptr = &remcomInBuffer[1];
>   		if (kgdb_hex2long(&ptr, &addr))
>   			regs->ret = addr;
> +		fallthrough;
>   
>   	case 'D':
>   	case 'k':

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
