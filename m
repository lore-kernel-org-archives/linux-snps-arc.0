From: willy@infradead.org (Matthew Wilcox)
Date: Mon, 13 Mar 2017 15:27:58 -0700
Subject: [RFC PATCH 11/13] mm/vas: Introduce VAS segments - shareable
 address space regions
In-Reply-To: <20170313221415.9375-12-till.smejkal@gmail.com>
References: <20170313221415.9375-1-till.smejkal@gmail.com>
 <20170313221415.9375-12-till.smejkal@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170313222758.GB4033@bombadil.infradead.org>
To: linux-snps-arc@lists.infradead.org

On Mon, Mar 13, 2017@03:14:13PM -0700, Till Smejkal wrote:
> +/**
> + * Create a new VAS segment.
> + *
> + * @param[in] name:		The name of the new VAS segment.
> + * @param[in] start:		The address where the VAS segment begins.
> + * @param[in] end:		The address where the VAS segment ends.
> + * @param[in] mode:		The access rights for the VAS segment.
> + *
> + * @returns:			The VAS segment ID on success, -ERRNO otherwise.
> + **/

Please follow the kernel-doc conventions, as described in
Documentation/doc-guide/kernel-doc.rst.  Also, function documentation
goes with the implementation, not the declaration.

> +/**
> + * Get ID of the VAS segment belonging to a given name.
> + *
> + * @param[in] name:		The name of the VAS segment for which the ID
> + *				should be returned.
> + *
> + * @returns:			The VAS segment ID on success, -ERRNO
> + *				otherwise.
> + **/
> +extern int vas_seg_find(const char *name);

So ... segments have names, and IDs ... and access permissions ...
Why isn't this a special purpose filesystem?
